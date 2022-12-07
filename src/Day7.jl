using AdventOfCode2022

input=pkgdir(AdventOfCode2022, "data", "Day7.txt")

dirs = Dict("/" => 0)
pwd = "/"
for line in readlines(input)[2:end]
    startswith(line, "\\\$ ls") && continue
    if startswith(line, "\\\$ cd")
        _, _, dest = split(line)
        if dest == ".."
            pwd = splitdir(pwd)[1]
        else
            pwd = joinpath(pwd, dest)
        end
        continue
    end
    if startswith(line, "dir")
        _, child = split(line, " ")
        dirs[joinpath(pwd, child)] = 0
        continue
    end
    size, _ = split(line, " ")
    dirs[pwd] += parse(Int, size)
    parent, base = splitdir(pwd)
    while base != ""
        dirs[parent] += parse(Int, size)
        parent, base = splitdir(parent)
    end
end

sum(v for (k, v) in filter(p -> p[2] < 100000, dirs))

minimum(values(filter(p -> p[2] > dirs["/"] + 30000000 - 70000000, dirs)))
