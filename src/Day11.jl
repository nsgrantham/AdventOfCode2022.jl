module Day11

using AdventOfCode2022

mutable struct Monkey
    items::Vector{Int}
    inspections::Int
    const op::Function
    const test_divisor::Int
    const throw_to_true::Int
    const throw_to_false::Int
end

function Base.parse(::Type{Monkey}, lines)
    items = parse.(Int, split(only(match(r"Starting items: ([\d\s,]+)", lines[2])), ", "))
    op = eval(Meta.parse("old -> " * only(match(r"new = (.+)", lines[3]))))
    test_divisor = parse(Int, only(match(r"divisible by (\d+)", lines[4])))
    throw_to_true = parse(Int, only(match(r"monkey (\d+)", lines[5]))) + 1
    throw_to_false = parse(Int, only(match(r"monkey (\d+)", lines[6]))) + 1
    Monkey(items, 0, op, test_divisor, throw_to_true, throw_to_false)
end

function inspect(monkey::Monkey, item::Int)
    monkey.inspections += 1
    Base.invokelatest(monkey.op, item)  # avoids potential world age issues because `op` is dynamically defined
end

function throw_to(monkey::Monkey, item::Int)
    item % monkey.test_divisor == 0 ? monkey.throw_to_true : monkey.throw_to_false
end

function monkey_business(monkeys::Vector{Monkey})
    prod(partialsort!([monkey.inspections for monkey in monkeys], 1:2, rev=true))
end

function keep_away!(monkeys::Vector{Monkey}, relieve::Function)
    for (i, monkey) in enumerate(monkeys)
        while !isempty(monkey.items)
            item = popfirst!(monkey.items)
            item = inspect(monkey, item)
            item = relieve(item)
            monkey_thrown_to = monkeys[throw_to(monkey, item)]
            push!(monkey_thrown_to.items, item)
        end
    end
end

function solve(input=pkgdir(AdventOfCode2022, "data", "Day11.txt"))
    lines = split(readchomp(input), r"\R", keepempty=false)
    monkeys = parse.(Monkey, Iterators.partition(lines, 6))

    monkeys1 = deepcopy(monkeys)
    for _ in 1:20
        keep_away!(monkeys1, item -> div(item, 3))
    end
    p1 = monkey_business(monkeys1)

    monkeys2 = deepcopy(monkeys)
    lcm = prod(monkey.test_divisor for monkey in monkeys2)  # Least common multiple
    for _ in 1:10_000
        keep_away!(monkeys2, item -> item % lcm)
    end
    p2 = monkey_business(monkeys2)

    p1, p2
end

end
