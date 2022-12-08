module Day7

using AdventOfCode2022

function solve(input=pkgdir(AdventOfCode2022, "data", "Day7.txt"))
    total_size = Dict{String, Int}()
    pwd = ""
    for line in eachline(input)
        startswith(line, "\$ ls") && continue
        startswith(line, "dir") && continue
        if startswith(line, "\$ cd")
            dir = last(split(line))
            pwd = dir == ".." ? first(splitdir(pwd)) : joinpath(pwd, dir)
        else
            file_size = parse(Int, first(split(line)))
            total_size[pwd] = get(total_size, pwd, 0) + file_size
            parent, base = splitdir(pwd)
            while base != ""
                total_size[parent] = get(total_size, parent, 0) + file_size
                parent, base = splitdir(parent)
            end
        end
    end
    p1 = sum(filter(<(100_000), collect(values(total_size))))
    min_delete_size = total_size["/"] + 30_000_000 - 70_000_000
    p2 = minimum(filter(>=(min_delete_size), collect(values(total_size))))
    p1, p2
end

end
