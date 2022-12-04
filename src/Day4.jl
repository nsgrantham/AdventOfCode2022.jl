module Day4

using AdventOfCode2022

assign_sections(ids) = range(parse.(Int, split(ids, "-"))...)

function solve(input=pkgdir(AdventOfCode2022, "data", "Day4.txt"))
    p1 = 0
    p2 = 0
    for pair in eachline(input)
        elf1, elf2 = assign_sections.(split(pair, ","))
        overlap = intersect(elf1, elf2)
        if overlap in [elf1, elf2]
            p1 += 1
        end
        if !isempty(overlap)
            p2 += 1
        end
    end
    p1, p2
end

end
