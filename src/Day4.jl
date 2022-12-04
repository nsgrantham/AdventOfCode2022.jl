using AdventOfCode2022

example = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""

input = pkgdir(AdventOfCode2022, "data", "Day4.txt")

p1 = 0
p2 = 0
for line in eachline(input)
    elf1, elf2 = split(line, ",")
    elf1_begin, elf1_end = split(elf1, "-")
    elf2_begin, elf2_end = split(elf2, "-")
    elf1_begin = parse(Int, elf1_begin)
    elf1_end = parse(Int, elf1_end)
    elf2_begin = parse(Int, elf2_begin)
    elf2_end = parse(Int, elf2_end)
    elf1_all = all(a in elf2_begin:elf2_end for a in elf1_begin:elf1_end)
    elf2_all = all(a in elf1_begin:elf1_end for a in elf2_begin:elf2_end)
    elf1_any = any(a in elf2_begin:elf2_end for a in elf1_begin:elf1_end)
    elf2_any = any(a in elf1_begin:elf1_end for a in elf2_begin:elf2_end)
    if elf1_all || elf2_all
        p1 += 1
    end
    if elf1_any || elf2_any
        p2 += 1
    end
end
@show p1
@show p2
