module Day10

using AdventOfCode2022

pixel(cycle::Int, x::Int) = mod1(cycle, 40) in x:x+2 ? '#' : '.'

function solve(input=pkgdir(AdventOfCode2022, "data", "Day10.txt"))
    x = 1
    xs = Int[]
    cycle = 1
    pixels = Char[]
    for instruction in eachline(input)
        is_addx = startswith(instruction, "addx")  # otherwise, noop
        cycles = is_addx ? 2 : 1
        for _ in 1:cycles
            push!(pixels, pixel(cycle, x))
            push!(xs, x)
            cycle += 1
        end
        is_addx && (x += parse(Int, last(split(instruction))))
    end
    p1 = sum(cycle * xs[cycle] for cycle in 20:40:220)
    p2 = join(vcat(reshape(pixels, 40, 6), fill('\n', 1, 6)))
    p1, p2
end

end
