# SPLIT THE NUMBER
# CHALLENGE DESCRIPTION:
#
# You are given a number N and a pattern. The pattern consists of lowercase latin letters and one operation "+" or "-". The challenge is to split the number and evaluate it according to this pattern e.g.
# 1232 ab+cd -> a:1, b:2, c:3, d:2 -> 12+32 -> 44
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. Each line of the file is a test case, containing the number and the pattern separated by a single whitespace. E.g.
#
#
# 1
# 2
# 3
# 4
# 5
# 3413289830 a-bcdefghij
# 776 a+bc
# 12345 a+bcde
# 1232 ab+cd
# 90602 a+bcde
# OUTPUT SAMPLE:
#
# For each test case print out the result of pattern evaluation. E.g.
#
#
# 1
# 2
# 3
# 4
# 5
# -413289827
# 83
# 2346
# 44
# 611
# Constraints:
# N is in range [100, 1000000000]

def split_number(str)
  numstring, pattern = str.split(" ")
  nums = numstring.split("")
  if pattern.include?("-")
    split_point = pattern.index("-")
    left = nums.slice(0, split_point)
    right = nums.slice(split_point, nums.length - 1)
    return left.join.to_i - right.join.to_i
  else
    split_point = pattern.index("+")
    left = nums.slice(0, split_point)
    right = nums.slice(split_point, nums.length - 1)
    return left.join.to_i + right.join.to_i
  end
end

p split_number("776 a+bc")
