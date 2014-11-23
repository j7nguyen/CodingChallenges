# CHALLENGE DESCRIPTION:
#
# Sudoku is a number-based logic puzzle. It typically comprises of a 9*9 grid with digits so that each column, each row and each of the nine 3*3 sub-grids that compose the grid contains all the digits from 1 to 9. For this challenge, you will be given an N*N grid populated with numbers from 1 through N and you have to determine if it is a valid sudoku solution. You may assume that N will be either 4 or 9. The grid can be divided into square regions of equal size, where the size of a region is equal to the square root of a side of the entire grid. Thus for a 9*9 grid there would be 9 regions of size 3*3 each.
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. Each line in this file contains the value of N, a semicolon and the sqaure matrix of integers in row major form, comma delimited. E.g.
#
# 4;1,4,2,3,2,3,1,4,4,2,3,1,3,1,4,2
# 4;2,1,3,2,3,2,1,4,1,4,2,3,2,3,4,1
# OUTPUT SAMPLE:
#
# Print out True/False if the grid is a valid sudoku layout. E.g.
#
# True
# False

def valid_sudoku?(str)
  grid_inputs = str.split(";")
  length = grid_inputs[0].delete(",").to_i
  grid = grid_inputs[1].split(",").map{|char| char.to_i}
  check_rows(grid, length) && check_columns(grid,length) && 
    minigrid_check(grid, length)
end

def check_rows(grid, length)
  left, right = 0, length - 1
  length.times do
    return false if grid[left..right].sort != (1..length).to_a
    left += length
    right += length
  end
  true
end

def check_columns(grid, length)
  first = 0
  length.times do
    checker = []
    (0...length).each do |int|
      checker << grid[first + length*int]
    end
    return false if checker.sort != (1..length).to_a
    first += 1
  end
  true
end

def minigrid_check(grid, length)
  mini_length = Math.sqrt(length).to_i
  (0...mini_length).each do |x|
    (0...mini_length).each do |y|
     checker = []
     left = mini_length * (x + y * length)
     right = left + mini_length
     mini_length.times do
       checker << grid[left...right]
       left += length
       right += length
     end
     return false if checker.flatten.sort != (1..length).to_a
    end
  end
  true
end

File.open(ARGV[0]).each_line do |line|
  if valid_sudoku?(line.delete("\n"))
    puts "True"
  else
    puts "False"
  end
end