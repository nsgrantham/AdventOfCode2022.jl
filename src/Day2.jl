module Day2

using AdventOfCode2022

function score1(elf, me)
    elf == "A" && me == "X" && return 1 + 3  # Rock + Draw
    elf == "A" && me == "Y" && return 2 + 6  # Paper + Win
    elf == "A" && me == "Z" && return 3 + 0  # Scissors + Loss
    elf == "B" && me == "X" && return 1 + 0  # Rock + Loss
    elf == "B" && me == "Y" && return 2 + 3  # Paper + Draw
    elf == "B" && me == "Z" && return 3 + 6  # Scissors + Win
    elf == "C" && me == "X" && return 1 + 6  # Rock + Win
    elf == "C" && me == "Y" && return 2 + 0  # Paper + Loss
    elf == "C" && me == "Z" && return 3 + 3  # Scissors + Draw
end

function score2(elf, me)
    elf == "A" && me == "X" && return 3 + 0  # Scissors + Loss
    elf == "A" && me == "Y" && return 1 + 3  # Rock + Draw
    elf == "A" && me == "Z" && return 2 + 6  # Paper + Win
    elf == "B" && me == "X" && return 1 + 0  # Rock + Loss
    elf == "B" && me == "Y" && return 2 + 3  # Paper + Draw
    elf == "B" && me == "Z" && return 3 + 6  # Scissors + Win
    elf == "C" && me == "X" && return 2 + 0  # Paper + Loss
    elf == "C" && me == "Y" && return 3 + 3  # Scissors + Draw
    elf == "C" && me == "Z" && return 1 + 6  # Rock + Win
end

function solve(input=pkgdir(AdventOfCode2022, "data", "Day2.txt"))
    p1 = 0
    p2 = 0
    for line in eachline(input)
        elf, me = split(line)
        p1 += score1(elf, me)
        p2 += score2(elf, me)
    end
    p1, p2
end

end
