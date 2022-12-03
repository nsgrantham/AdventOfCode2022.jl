module Day3

using AdventOfCode2022

function compartments(rucksack::String)
    mid = div(length(rucksack), 2)
    rucksack[1:mid], rucksack[mid+1:end]
end

priority(item::Char) = islowercase(item) ? item - 'a' + 1 : item - 'A' + 27

function solve(input=pkgdir(AdventOfCode2022, "data", "Day3.txt"))
    rucksacks = readlines(input)
    p1 = sum(
        priority(only(intersect(compartments(rucksack)...)))
        for rucksack in rucksacks
    )
    p2 = sum(
        priority(only(intersect(group...)))
        for group in Iterators.partition(rucksacks, 3)
    )
    p1, p2
end

end
