module Day15

using AdventOfCode2022

struct Sensor
    x::Int
    y::Int
    r::Int  # radius, as measured by the Manhattan distance
end

Base.isequal(a::Sensor, b::Sensor) = a.x == b.x && a.y == b.y

struct Beacon
    x::Int
    y::Int
end

Base.isequal(a::Beacon, b::Beacon) = a.x == b.x && a.y == b.y
tuning_frequency(beacon::Beacon) = 4_000_000 * beacon.x + beacon.y

function Base.parse(::Type{Tuple{Sensor, Beacon}}, line)
    re = r"Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)"
    sx, sy, bx, by = parse.(Int, match(re, line).captures)
    sr = abs(sx - bx) + abs(sy - by)
    Sensor(sx, sy, sr), Beacon(bx, by)
end

function xrange(sensor::Sensor, y::Int)
    v = abs(sensor.y - y)
    h = sensor.r - v
    (sensor.x - h):(sensor.x + h)
end

xrange(sensors::Vector{Sensor}, y::Int) = disjointify!(xrange.(sensors, y))

"""
Given a collection of overlapping unit ranges, assemble a
collection of disjoint unit ranges with the same coverage.
"""
function disjointify!(ranges::Vector{UnitRange{Int}})
    filter!(r -> length(r) > 0, ranges)
    n = length(ranges) + 1
    while length(ranges) < n
        n = length(ranges)
        for i in eachindex(ranges), j in Iterators.drop(eachindex(ranges), i)
            a, b = ranges[i], ranges[j]
            if !isdisjoint(a, b)
                ranges[i] = min(first(a), first(b)):max(last(a), last(b))
                deleteat!(ranges, j)
                break
            end
        end
    end
    ranges
end

function find_beacon(sensors::Vector{Sensor}, search::UnitRange{Int})
    for y in search
        ranges = xrange(sensors, y)
        issubset(search, first(ranges)) && continue
        not_in_ranges(x) = !any(range -> x in range, ranges)
        x = search[findfirst(not_in_ranges, search)]
        return x, y
    end
    nothing
end

function solve(
    input=pkgdir(AdventOfCode2022, "data", "Day15.txt");
    y::Int=2_000_000,
    search::UnitRange{Int}=0:4_000_000
)
    pairs = parse.(Tuple{Sensor, Beacon}, eachline(input))
    sensors = unique(first.(pairs))
    beacons = unique(last.(pairs))
    p1 = sum(length, xrange(sensors, y)) - count(beacon -> beacon.y == y, beacons)
    p2 = tuning_frequency(Beacon(find_beacon(sensors, search)...))
    p1, p2
end

end
