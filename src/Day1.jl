module Day1

using AdventOfCode2022

function solve(input=pkgdir(AdventOfCode2022, "data", "Day1.txt"))
    x = Int[]
    s = 0
    for line in eachline(input)
        if line == ""
            push!(x, s)
            s = 0
            continue
        end
        s += parse(Int, line)
    end
    push!(x, s)
    p1 = maximum(x)
    p2 = sum(sort(x, rev=true)[1:3])
    p1, p2
end

end
