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

@testset "Day 7" begin
    example = """
    \$ cd /
    \$ ls
    dir a
    14848514 b.txt
    8504156 c.dat
    dir d
    \$ cd a
    \$ ls
    dir e
    29116 f
    2557 g
    62596 h.lst
    \$ cd e
    \$ ls
    584 i
    \$ cd ..
    \$ cd ..
    \$ cd d
    \$ ls
    4060174 j
    8033020 d.log
    5626152 d.ext
    7214296 k
    """
    @test AdventOfCode2022.Day7.solve(IOBuffer(example)) == (95437, 24933642)
end

@testset "Day 9" begin
    example1 = """
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2"""
    example2 = """
R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20"""
    @test AdventOfCode2022.Day9.solve(IOBuffer(example1)) == (13, 1)
    @test AdventOfCode2022.Day9.solve(IOBuffer(example2)) == (88, 36)
end

@testset "Day 10" begin
    example = """
addx 15
addx -11
addx 6
addx -3
addx 5
addx -1
addx -8
addx 13
addx 4
noop
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx -35
addx 1
addx 24
addx -19
addx 1
addx 16
addx -11
noop
noop
addx 21
addx -15
noop
noop
addx -3
addx 9
addx 1
addx -3
addx 8
addx 1
addx 5
noop
noop
noop
noop
noop
addx -36
noop
addx 1
addx 7
noop
noop
noop
addx 2
addx 6
noop
noop
noop
noop
noop
addx 1
noop
noop
addx 7
addx 1
noop
addx -13
addx 13
addx 7
noop
addx 1
addx -33
noop
noop
noop
addx 2
noop
noop
noop
addx 8
noop
addx -1
addx 2
addx 1
noop
addx 17
addx -9
addx 1
addx 1
addx -3
addx 11
noop
noop
addx 1
noop
addx 1
noop
noop
addx -13
addx -19
addx 1
addx 3
addx 26
addx -30
addx 12
addx -1
addx 3
addx 1
noop
noop
noop
addx -9
addx 18
addx 1
addx 2
noop
noop
addx 9
noop
noop
noop
addx -1
addx 2
addx -37
addx 1
addx 3
noop
addx 15
addx -21
addx 22
addx -6
addx 1
noop
addx 2
addx 1
noop
addx -10
noop
noop
addx 20
addx 1
addx 2
addx 2
addx -6
addx -11
noop
noop
noop
"""
    image = """
##..##..##..##..##..##..##..##..##..##..
###...###...###...###...###...###...###.
####....####....####....####....####....
#####.....#####.....#####.....#####.....
######......######......######......####
#######.......#######.......#######.....
"""
    @test AdventOfCode2022.Day10.solve(IOBuffer(example)) == (13140, image)
end
