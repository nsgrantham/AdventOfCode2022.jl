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

@testset "Day 4" begin
    example = IOBuffer(
        """
        2-4,6-8
        2-3,4-5
        5-7,7-9
        2-8,3-7
        6-6,4-6
        2-6,4-8
        """
    )
    @test AdventOfCode2022.Day4.solve(example) == (2, 4)
end

@testset "Day 5" begin
    example = IOBuffer(
"""
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""
    )
    @test AdventOfCode2022.Day5.solve(example) == ("CMZ", "MCD")
end

@testset "Day 6" begin
    example1 = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
    example2 = "bvwbjplbgvbhsrlpgdmjqwftvncz"
    example3 = "nppdvjthqldpwncqszvftbrmjlhg"
    example4 = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
    example5 = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"

    @test AdventOfCode2022.Day6.solve(IOBuffer(example1)) == (7, 19)
    @test AdventOfCode2022.Day6.solve(IOBuffer(example2)) == (5, 23)
    @test AdventOfCode2022.Day6.solve(IOBuffer(example3)) == (6, 23)
    @test AdventOfCode2022.Day6.solve(IOBuffer(example4)) == (10, 29)
    @test AdventOfCode2022.Day6.solve(IOBuffer(example5)) == (11, 26)
end
