# DETECTING CYCLES
# CHALLENGE DESCRIPTION:
#
#
# Given a sequence, write a program to detect cycles within it.
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename containing a sequence of numbers (space delimited). The file can have multiple such lines. E.g
#
#
# 1
# 2
# 3
# 2 0 6 3 1 6 3 1 6 3 1
# 3 4 8 0 11 9 7 2 5 6 10 1 49 49 49 49
# 1 2 3 1 2 3 1 2 3
# OUTPUT SAMPLE:
#
# Print to stdout the first cycle you find in each sequence. Ensure that there are no trailing empty spaces on each line you print. E.g.
#
#
# 1
# 2
# 3
# 6 3 1
# 49
# 1 2 3
# The cycle detection problem is explained more widely on wiki
# Constrains:
# The elements of the sequence are integers in range [0, 99]
# The length of the sequence is in range [0, 50]

def find_indeces(arr, target)
  match_indeces = []
  arr.each_with_index do |el, i|
    match_indeces << i if el == target
  end
  
  return match_indeces
end

def detect(numstring)
  nums = numstring.split(" ").map {|num| num.to_i}
  pattern = []
  until nums.length == 1
    current_char = nums.shift
    if nums.include?(current_char)
      search_points = find_indeces(nums, current_char)
      temp_patterns = []
      search_points.each do |start_point|
        temp_pattern = [current_char]
        first_point, second_point = 0, start_point + 1
        match = true
        until !match || nums[first_point] == current_char
          match = false
          if nums[first_point] == nums[second_point]
            match = true
            temp_pattern << nums[first_point] 
          end
          first_point += 1
          second_point += 1
        end
        temp_patterns << temp_pattern
      end
      return_pattern = temp_patterns.max_by {|pattern| pattern.length}
      return return_pattern.join(" ")
    end
  end
end

File.open(ARGV[0]).each_line do |line|
  line.delete!("\n")
  puts detect(line)
end