module Day3

using AdventOfCode2022

compartments(rucksack) = rucksack[1:div(end,2)], rucksack[div(end,2)+1:end]

priority(item) = islowercase(item) ? item - 'a' + 1 : item - 'A' + 27

find_shared_item_priority(packs) = priority(only(intersect(packs...)))

function solve(input=pkgdir(AdventOfCode2022, "data", "Day3.txt"))
    rucksacks = readlines(input)
    p1 = sum(find_shared_item_priority, compartments.(rucksacks))
    p2 = sum(find_shared_item_priority, Iterators.partition(rucksacks, 3))
    p1, p2
end

end
