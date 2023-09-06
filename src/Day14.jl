module Day14

using AdventOfCode2022


struct Sand
    x::Int
    y::Int
end

Base.isequal(a::Sand, b::Sand) = a.x == b.x && a.y == b.y


mutable struct Cavern
    filled_tiles::Set{Sand}
    max_depth::Int
    has_floor::Bool
end

function Base.parse(::Type{Cavern}, lines)
    rocks = Set{Sand}()
    for line in lines
        points = [Tuple(parse.(Int, split(pair, ','))) for pair in split(line, " -> ")]
        for i in 1:length(points)-1
            (x1, y1), (x2, y2) = points[i:i+1]
            if x1 == x2
                for y in y1:sign(y2-y1):y2
                    push!(rocks, Sand(x1, y))
                end
            end
            if y1 == y2
                for x in x1:sign(x2-x1):x2
                    push!(rocks, Sand(x, y1))
                end
            end
        end
    end
    Cavern(rocks, maximum(rock.y for rock in rocks), false)
end


function is_blocked(sand::Sand, cavern::Cavern)
    sand in cavern.filled_tiles || (cavern.has_floor && sand.y == cavern.max_depth + 2)
end

function step(sand::Sand, cavern::Cavern)
    for (dx, dy) in [(0, 1), (-1, 1), (1, 1)]
        next = Sand(sand.x + dx, sand.y + dy)
        !is_blocked(next, cavern) && return next
    end
    sand
end

function is_falling_forever(sand::Sand, cavern::Cavern)
    cavern.has_floor ? false : sand.y >= cavern.max_depth
end


function drop_sand!(cavern::Cavern, sand::Sand)
    prev = sand
    while true
        sand = step(prev, cavern)
        sand == prev && break
        is_falling_forever(sand, cavern) && return sand
        prev = sand
    end
    push!(cavern.filled_tiles, sand)
    sand
end


function solve(input=pkgdir(AdventOfCode2022, "data", "Day14.txt"))
    cavern = parse(Cavern, readlines(input))
    num_rocks = length(cavern.filled_tiles)
    origin = Sand(500, 0)

    while true
        sand_maybe_falling_forever = drop_sand!(cavern, origin)
        is_falling_forever(sand_maybe_falling_forever, cavern) && break
    end
    p1 = length(cavern.filled_tiles) - num_rocks

    cavern.has_floor = true
    while true
        sand_at_rest = drop_sand!(cavern, origin)
        sand_at_rest == origin && break
    end
    p2 = length(cavern.filled_tiles) - num_rocks

    p1, p2
end

end
