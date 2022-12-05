using AdventOfCode2022

example = """
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""

lines = readlines(IOBuffer(example))

cols = [
    ['Z', 'N'],
    ['M', 'C', 'D'],
    ['P']
]

for line in lines[6:end]
    pos = replace(line, "move " => "", "from " => "", "to " => "")
    n, a, b = parse.(Int, split(pos))
    new = Char[]
    for i in 1:n
        push!(new, pop!(cols[a]))
    end
    push!(cols[b], new...)
end
cols

input = pkgdir(AdventOfCode2022, "data", "Day5.txt")
lines = readlines(input)

cols = [
    ['J', 'H', 'G', 'M', 'Z', 'N', 'T', 'F'],
    ['V', 'W', 'J'],
    ['G', 'V', 'L', 'J', 'B', 'T', 'H'],
    ['B', 'P', 'J', 'N', 'C', 'D', 'V', 'L'],
    ['F', 'W', 'S', 'M', 'P', 'R', 'G'],
    ['G', 'H', 'C', 'F', 'B', 'N', 'V', 'M'],
    ['D', 'H', 'G', 'M', 'R'],
    ['H', 'N', 'M', 'V', 'Z', 'D'],
    ['G', 'N', 'F', 'H']
]

for line in lines[11:end]
    pos = replace(line, "move " => "", "from " => "", "to " => "")
    n, a, b = parse.(Int, split(pos))
    new = Char[]
    for i in 1:n
        push!(new, pop!(cols[a]))
    end
    push!(cols[b], new...)
end
cols

cols = [
    ['J', 'H', 'G', 'M', 'Z', 'N', 'T', 'F'],
    ['V', 'W', 'J'],
    ['G', 'V', 'L', 'J', 'B', 'T', 'H'],
    ['B', 'P', 'J', 'N', 'C', 'D', 'V', 'L'],
    ['F', 'W', 'S', 'M', 'P', 'R', 'G'],
    ['G', 'H', 'C', 'F', 'B', 'N', 'V', 'M'],
    ['D', 'H', 'G', 'M', 'R'],
    ['H', 'N', 'M', 'V', 'Z', 'D'],
    ['G', 'N', 'F', 'H']
]

for line in lines[11:end]
    pos = replace(line, "move " => "", "from " => "", "to " => "")
    n, a, b = parse.(Int, split(pos))
    new = Char[]
    for i in 1:n
        push!(new, pop!(cols[a]))
    end
    push!(cols[b], reverse(new)...)
end
cols
