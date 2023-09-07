module Day8

using AdventOfCode2022


const Trees = Matrix{Int}

function Base.parse(::Type{Trees}, lines::Vector{String})
    Trees(parse.(Int, permutedims(hcat(collect.(lines)...))))
end


function count_visible(trees::Trees)
    m, n = size(trees)
    m == 2 || n == 2 && return m * n
    
    num_not_visible = 0

    for (i, tree) in pairs(trees)
        x, y = Tuple(i)
          
        (x == 1 || y == 1 || x == m || y == n) && continue

        u = view(trees, 1:(x-1), y:y)
        d = view(trees, (x+1):m, y:y)
        l = view(trees, x:x, 1:(y-1))
        r = view(trees, x:x, (y+1):n)
        
        all(<(tree), u) && continue
        all(<(tree), d) && continue
        all(<(tree), l) && continue
        all(<(tree), r) && continue
        
        num_not_visible += 1
    end

    m * n - num_not_visible
end


function scenic_scores(trees::Trees)
    m, n = size(trees)
    scores = ones(Int, m, n)

    for (i, tree) in pairs(trees)
        x, y = Tuple(i)
        
        if x == 1 || y == 1 || x == m || y == n
            scores[i] = 0
            continue
        end
          
        tree_lines = [
            reverse(view(trees, 1:(x-1), y:y)),
            view(trees, (x+1):m, y:y),
            reverse(view(trees, x:x, 1:(y-1))),
            view(trees, x:x, (y+1):n)
        ]
        
        for tree_line in tree_lines
            seen = 0
            for next_nearest_tree in tree_line
                seen += 1
                tree <= next_nearest_tree && break
            end
            scores[i] *= seen
        end
    end
    
    scores
end


function solve(input=pkgdir(AdventOfCode2022, "data", "Day8.txt"))
    trees = parse(Trees, readlines(input))
    p1 = count_visible(trees)
    p2 = maximum(scenic_scores(trees))
    p1, p2
end

end
