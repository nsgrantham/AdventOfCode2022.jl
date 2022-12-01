module Day1

using AdventOfCode2022

function solve(input=pkgdir(AdventOfCode2022, "data", "Day1.txt"))
    elves = Int[]
    calories = 0
    for line in eachline(input)
        if line == ""
            push!(elves, calories)
            calories = 0
        else
            calories += parse(Int, line)
        end
    end
    push!(elves, calories)
    p1 = maximum(elves)
    p2 = sum(partialsort!(elves, 1:3, rev=true))
    p1, p2
end

end
