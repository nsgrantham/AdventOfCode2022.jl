module Day6

using AdventOfCode2022

function find_start_marker(stream, n)
    findfirst(
        i -> allunique(@view stream[i-n+1:i]),
        n:lastindex(stream)
    ) + n - 1
end

function solve(input=pkgdir(AdventOfCode2022, "data", "Day6.txt"))
    stream = read(input, String)
    p1 = find_start_marker(stream, 4)
    p2 = find_start_marker(stream, 14)
    p1, p2
end

end
