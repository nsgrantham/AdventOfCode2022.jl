module Day5

using AdventOfCode2022

function solve(input = pkgdir(AdventOfCode2022, "data", "Day5.txt"))
    lines = readlines(input)

    stack_rows = reverse(filter(line -> contains(line, "["), lines))
    n_stacks = maximum(parse.(Int, split(only(filter(line -> startswith(line, " 1"), lines)))))

    stacks = [Char[] for _ in 1:n_stacks]
    for stack_row in stack_rows
        for i in 1:n_stacks
            crate_index = 1 + i + 3 * (i - 1)
            crate_index > length(stack_row) && continue
            crate = stack_row[crate_index]
            if isletter(crate)
                push!(stacks[i], crate)
            end
        end
    end

    moves = filter(line -> startswith(line, "move"), lines)
    instruction = r"move (\d+) from (\d+) to (\d+)"

    stacks1 = deepcopy(stacks)
    for move in moves
        n, from, to = parse.(Int, match(instruction, move).captures)
        for i in 1:n
            push!(stacks1[to], pop!(stacks1[from]))
        end
    end
    p1 = join(stack[end] for stack in stacks1)

    stacks2 = deepcopy(stacks)
    for move in moves
        n, from, to = parse.(Int, match(instruction, move).captures)
        crane = Char[]
        for i in 1:n
            pushfirst!(crane, pop!(stacks2[from]))
        end
        push!(stacks2[to], crane...)
    end
    p2 = join(stack[end] for stack in stacks2)

    p1, p2
end

end
