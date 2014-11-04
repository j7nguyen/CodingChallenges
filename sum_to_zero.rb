# SUM TO ZERO
# CHALLENGE DESCRIPTION:
#
# You are given an array of integers. Count the numbers of ways in which the sum of 4 elements in this array results in zero.
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. Each line in this file consist of comma separated positive and negative integers. E.g.
#
# 2,3,1,0,-4,-1
# 0,-1,3,-2
# OUTPUT SAMPLE:
#
# Print out the count of the different number of ways that 4 elements sum to zero. E.g.
#
# 2
# 1
# 

def zero_sum_count(line)
  sum_count = 0

  nums = line.delete("\n").split(",").map {|n| n.to_i}

  (0...(nums.count-3)).each do |a|
    (a...(nums.count-2)).each do |b|
      next if b == a
      (b...(nums.count-1)).each do |c|
        next if c == b || c == a
        (c...nums.count).each do |d|
          next if d == a || d == b || d == c
          sum_count += 1 if (nums[a] + nums[b] + nums[c] + nums[d]) == 0
        end
      end
    end
  end
  
  return sum_count    
end

File.open(ARGV[0]).each_line do |line|
  puts zero_sum_count(line)
end