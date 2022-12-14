module Day14

using AdventOfCode2022

example = """
498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9
"""

rocks = Set{Tuple{Int, Int}}()
for line in readlines(IOBuffer(example))
#for line in readlines(input)
    coords = Tuple{Int, Int}[]
    for coord in split(line, " -> ")
        push!(coords, Tuple(parse.(Int, split(coord, ','))))
    end
    for i in 1:length(coords)-1
        (x1, y1), (x2, y2) = coords[i:i+1]
        if x1 == x2
            ys = y1:sign(y2-y1):y2
            push!(rocks, [(x1, y) for y in ys]...)
        end
        if y1 == y2
            xs = x1:sign(x2-x1):x2
            push!(rocks, [(x, y1) for x in xs]...)
        end
    end
end

blockers = deepcopy(rocks)
lowest_y = maximum(last(rock) for rock in rocks)
i = 0
more_sand = true
while more_sand
    sand = Sand(500, 0)
    is_sand_falling = true
    while is_sand_falling
        if sand.y + 1 > lowest_y
            more_sand = false
            println(i)
            break
        end
        if (sand.x, sand.y + 1) in blockers
            if (sand.x - 1, sand.y + 1) in blockers
                if (sand.x + 1, sand.y + 1) in blockers
                    i += 1
                    push!(blockers, (sand.x, sand.y))
                    is_sand_falling = false
                else
                    sand.x += 1
                    sand.y += 1
                end
            else
                sand.x -= 1
                sand.y += 1
            end
        else
            sand.y += 1
        end
    end
end


blockers = deepcopy(rocks)
i = 0
more_sand = true
while more_sand
    sand = Sand(500, 0)
    is_sand_falling = true
    while is_sand_falling
        if (500, 0) in blockers
            more_sand = false
            println(i)
            break
        end

        if ((sand.x, sand.y + 1) in blockers) || (sand.y + 1 == lowest_y + 2)
            if ((sand.x - 1, sand.y + 1) in blockers) || (sand.y + 1 == lowest_y + 2)
                if ((sand.x + 1, sand.y + 1) in blockers) || (sand.y + 1 == lowest_y + 2)
                    i += 1
                    push!(blockers, (sand.x, sand.y))
                    is_sand_falling = false
                else
                    sand.x += 1
                    sand.y += 1
                end
            else
                sand.x -= 1
                sand.y += 1
            end
        else
            sand.y += 1
        end
    end
end

end
