using AdventOfCode2022
using Test

@testset "Day 1" begin
    example = IOBuffer(
        """
        1000
        2000
        3000

        4000

        5000
        6000

        7000
        8000
        9000

        10000
        """
    )
    @test AdventOfCode2022.Day1.solve(example) == (24000, 45000)
end

@testset "Day 2" begin
    example = IOBuffer(
        """
        A Y
        B X
        C Z
        """
    )
    @test AdventOfCode2022.Day2.solve(example) == (15, 12)
end

@testset "Day 3" begin
    example = IOBuffer(
        """
        vJrwpWtwJgWrhcsFMMfFFhFp
        jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
        PmmdzqPrVvPwwTWBwg
        wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
        ttgJtRGJQctTZtZT
        CrZsJsPPZsGzwwsLwLmpwMDw
        """
    )
    @test AdventOfCode2022.Day3.solve(example) == (157, 70)
end
