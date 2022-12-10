module Day10

using AdventOfCode2022

pixel(cycle::Int, X::Int) = mod1(cycle, 40) in X:X+2 ? '#' : '.'

function solve(input=pkgdir(AdventOfCode2022, "data", "Day10.txt"))
    X = 1
    cycle = 1
    pixels = Char[]
    strengths = Int[]
    for instruction in eachline(input)
        is_addx = startswith(instruction, "addx")  # otherwise, noop
        cycles = Int(is_addx) + 1
        for _ in 1:cycles
            push!(pixels, pixel(cycle, X))
            push!(strengths, cycle * X)
            cycle += 1
        end
        is_addx && (X += parse(Int, last(split(instruction))))
    end
    p1 = sum(strengths[cycle] for cycle in 20:40:220)
    p2 = join(vcat(reshape(pixels, 40, 6), fill('\n', 1, 6)))
    p1, p2
end

end
