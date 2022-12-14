module Day13

using AdventOfCode2022

struct Packet
    data::Vector
end

Base.parse(::Type{Packet}, s::AbstractString) = Packet(eval(Meta.parse(s)))
Base.isless(left::Packet, right::Packet) = compare(left.data, right.data) <= 0

function compare(left::Vector, right::Vector)
    L, R = length(left), length(right)
    for i in 1:min(L, R)
        x = compare(left[i], right[i])
        x == 0 || return x
    end
    compare(L, R)
end

compare(left::Vector, right::Int) = compare(left, [right])
compare(left::Int, right::Vector) = compare([left], right)
compare(left::Int, right::Int) = sign(left - right)

function solve(input=pkgdir(AdventOfCode2022, "data", "Day13.txt"))
    packets = parse.(Packet, split(readchomp(input), r"\R", keepempty=false))

    packet_pairs = collect(Iterators.partition(packets, 2))
    p1 = sum(findall(issorted, packet_pairs))

    divider_packets = (Packet([[2]]), Packet([[6]]))
    push!(packets, divider_packets...)
    sort!(packets)
    p2 = prod(findall(in(divider_packets), packets))

    p1, p2
end

end
