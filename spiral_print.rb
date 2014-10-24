# SPIRAL PRINTING
# CHALLENGE DESCRIPTION:
#
# Write a program to print a 2D array (n x m) in spiral order (clockwise)
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. The input file contains several lines. Each line is one test case. Each line contains three items (semicolon delimited). The first is 'n'(rows), the second is 'm'(columns) and the third is a single space separated list of characters/numbers in row major order. E.g.
#
# 3;3;1 2 3 4 5 6 7 8 9
# 
# OUTPUT SAMPLE:
#
# Print out the matrix in clockwise fashion, one per line, space delimited. E.g.
#
# 1 2 3 6 9 8 7 4 5

def next_position(current_pos, last_pos, num_rows, num_cols, turn_right = false)
  next_pos = current_pos.dup
  direction = []
  current_pos.each_with_index {|coord, ind| direction << coord - last_pos[ind]}
  if direction == [1,0]
    if current_pos[0] + 1 < num_cols && turn_right == false
      next_pos[0] += 1
    else
      next_pos[1] += 1
    end
  elsif direction == [0,1]
    if current_pos[1] + 1 < num_rows && turn_right == false
      next_pos[1] += 1
    else
      next_pos[0] -= 1
    end
  elsif direction == [-1,0]
    if current_pos[0] > 0 && turn_right == false
      next_pos[0] -= 1
    else
      next_pos[1] -= 1
    end
  else
    if current_pos[1] > 0 && turn_right == false
      next_pos[1] -= 1
    else
      next_pos[0] += 1
    end
  end

  return next_pos
end

def spiral_print(line)
  grid = []
  info = line.delete("\n").split(";")
  num_rows, num_cols = info[0].to_i, info[1].to_i
  chars = info[2].split(' ')
  a, b = 0, num_cols
  num_rows.to_i.times do 
    grid << chars[a...b]
    a += num_cols
    b += num_cols
  end

  output = []
  output << grid[0][0]
  last_pos = [0,0]
  current_pos = [1,0]
  done = false
  visited_positions = [last_pos, current_pos]

  until done
    output << grid[current_pos[1]][current_pos[0]]
    next_pos = next_position(current_pos, last_pos, num_rows, num_cols)
    if visited_positions.include?(next_pos)
      next_pos = next_position(current_pos, last_pos, num_rows, num_cols, true)
    end
    last_pos = current_pos
    current_pos = next_pos
    visited_positions << last_pos

    done = true if visited_positions.length == num_rows * num_cols + 1
  end
  
  puts output.join(' ')
  
end

File.open(ARGV[0]).each_line do |line|
  spiral_print(line)
end