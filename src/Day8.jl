using AdventOfCode2022

example = """
30373
25512
65332
33549
35390
"""

input = pkgdir(AdventOfCode2022, "data", "Day8.txt")

const TreeMap = Dict{CartesianIndex{2}, Int}

function Base.parse(::Type{TreeMap}, lines::Vector{String})
    heights = parse.(Int, permutedims(hcat(collect.(lines)...)))
    TreeMap(Dict(zip(CartesianIndices(heights), heights)))
end

function is_visible_up(treemap, point, height)
    i = 1
    while true
        neighbor = get(trees, point + CartesianIndex((-i, 0)), -1)
        neighbor < 0 && break # off grid
        height <= neighbor && return false
        i += 1
    end
    true
end

function is_visible_down(treemap, point, height)
    i = 1
    while true
        neighbor = get(trees, point + CartesianIndex((i, 0)), -1)
        neighbor < 0 && break # off grid
        height <= neighbor && return false
        i += 1
    end
    true
end

function is_visible_left(treemap, point, height)
    i = 1
    while true
        neighbor = get(trees, point + CartesianIndex((0, -i)), -1)
        neighbor < 0 && break # off grid
        height <= neighbor && return false
        i += 1
    end
    true
end

function is_visible_right(treemap, point, height)
    i = 1
    while true
        neighbor = get(trees, point + CartesianIndex((0, i)), -1)
        neighbor < 0 && break # off grid
        height <= neighbor && return false
        i += 1
    end
    true
end

function find_visible_trees(treemap::TreeMap)
    s = 0
    for (point, height) in treemap
        if is_visible_up(treemap, point, height)
            s += 1
            continue
        end
        if is_visible_down(treemap, point, height)
            s += 1
            continue
        end
        if is_visible_right(treemap, point, height)
            s += 1
            continue
        end
        if is_visible_left(treemap, point, height)
            s += 1
            continue
        end
    end
    s
end


function find_scenic_score(tree, treemap)
    point, height = tree
    u = count_visible_up(treemap, point, height)
    d = count_visible_down(treemap, point, height)
    r = count_visible_right(treemap, point, height)
    l = count_visible_left(treemap, point, height)
    u * d * r * l
end

function count_visible_up(treemap, point, height)
    i = 1
    while true
        neighbor = get(trees, point + CartesianIndex((-i, 0)), -1)
        neighbor < 0 && return i - 1
        neighbor >= height && return i
        i += 1
    end
end

function count_visible_down(treemap, point, height)
    i = 1
    while true
        neighbor = get(trees, point + CartesianIndex((i, 0)), -1)
        neighbor < 0 && return i - 1
        neighbor >= height && return i
        i += 1
    end
    true
end

function count_visible_left(treemap, point, height)
    i = 1
    while true
        neighbor = get(trees, point + CartesianIndex((0, -i)), -1)
        neighbor < 0 && return i - 1
        neighbor >= height && return i
        i += 1
    end
    true
end

function count_visible_right(treemap, point, height)
    i = 1
    while true
        neighbor = get(trees, point + CartesianIndex((0, i)), -1)
        neighbor < 0 && return i - 1
        neighbor >= height && return i
        i += 1
    end
    true
end

trees = parse(TreeMap, readlines(IOBuffer(example)))

trees = parse(TreeMap, readlines(input))

find_visible_trees(trees)

maximum(find_scenic_score(tree, trees) for tree in trees)
