module Day9

using AdventOfCode2022

mutable struct Knot
    x::Int
    y::Int
end

Base.copy(k::Knot) = Knot(k.x, k.y)
Base.hash(k::Knot, h::UInt) = hash((k.x, k.y), h)
Base.isequal(a::Knot, b::Knot) = a.x == b.x && a.y == b.y

function move!(rope::Vector{Knot}, dir::Symbol)
    head, tails... = rope

    dir == :R && (head.x += 1)
    dir == :L && (head.x -= 1)
    dir == :U && (head.y += 1)
    dir == :D && (head.y -= 1)

    for tail in tails
        dx = head.x - tail.x
        dy = head.y - tail.y
        if abs(dx) > 1 || abs(dy) > 1
            tail.x += sign(dx)
            tail.y += sign(dy)
        end
        head = tail
    end
end

function solve(input=pkgdir(AdventOfCode2022, "data", "Day9.txt"))
    rope1 = [Knot(0, 0) for _ in 1:2]
    rope2 = [Knot(0, 0) for _ in 1:10]
    visited1 = Set{Knot}()
    visited2 = Set{Knot}()

    for line in eachline(input)
        dir, steps = split(line)
        dir, steps = Symbol(dir), parse(Int, steps)
        for _ in 1:steps
            move!(rope1, dir)
            move!(rope2, dir)
            push!(visited1, copy(last(rope1)))
            push!(visited2, copy(last(rope2)))
        end
    end

    p1 = length(visited1)
    p2 = length(visited2)
    p1, p2
end

end
