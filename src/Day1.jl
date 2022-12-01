module Day1

using AdventOfCode2022

function solve(input=pkgdir(AdventOfCode2022, "data", "Day1.txt"))
    elf_calories = [0]
    for line in eachline(input)
       if line == ""
           push!(elf_calories, 0)
       else
           elf_calories[end] += parse(Int, line)
       end
    end
    p1 = maximum(elf_calories)
    p2 = sum(partialsort!(elf_calories, 1:3, rev=true))
    p1, p2
end

end
