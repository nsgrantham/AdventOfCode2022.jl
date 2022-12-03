module Day2

using AdventOfCode2022

function solve(input=pkgdir(AdventOfCode2022, "data", "Day2.txt"))
    p1 = 0
    p2 = 0
    score1 = [1 2 3; 1 2 3; 1 2 3] + [3 6 0; 0 3 6; 6 0 3]
    score2 = [3 1 2; 1 2 3; 2 3 1] + [0 3 6; 0 3 6; 0 3 6]
    for (elf, _, me) in eachline(input)
        p1 += score1[elf - 'A' + 1, me - 'X' + 1]
        p2 += score2[elf - 'A' + 1, me - 'X' + 1]
    end
    p1, p2
end

end
