# CHALLENGE DESCRIPTION:
#
# You are climbing a stair case. It takes n steps to reach to the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. Each line in this file contains a positive integer which is the total number of stairs.
# Ignore all empty lines. E.g.
#
#
# 1
# 2
# 10
# 20
# OUTPUT SAMPLE:
#
# Print out the number of ways to climb to the top of the staircase. E.g.
#
#
# 1
# 2
# 89
# 10946
# Constraints:
# The total number of stairs is <= 1000

# def num_routes(stairs)
#   if stairs == 1
#     return 1
#   elsif stairs == 2
#     return 2
#   else
#     return num_routes(stairs - 1) + num_routes(stairs - 2)
#   end
# end

def num_routes(n)
  return 1 if n == 1
  return 2 if n == 2
  current = 2
  previous = 1
  count = 2
  until count == n
    temp = current
    current += previous
    previous = temp
    count += 1
  end
  return current
end

File.open(ARGV[0]).each_line do |line|
  num_stairs = line.delete("\n").to_i
  puts num_routes(num_stairs)
end
