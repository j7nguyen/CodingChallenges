# CHALLENGE DESCRIPTION:
#
# Given a list of numbers and a positive integer k, reverse the elements of the list, k items at a time. If the number of elements is not a multiple of k, then the remaining items in the end should be left as is.
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. Each line in this file contains a list of numbers and the number k, separated by a semicolon. The list of numbers are comma delimited. E.g.
#
# 1,2,3,4,5;2
# 1,2,3,4,5;3
# OUTPUT SAMPLE:
#
# Print out the new comma separated list of numbers obtained after reversing. E.g.
#
# 2,1,4,3,5
# 3,2,1,4,5
# Submit your solution in a file (some file name).(py2| c| cpp| java| rb| pl| php| tcl| clj| js| scala| cs| m| py3| hs| go| bash| lua) or use the online editor.

def reverse(nums, interval)
  new_nums = []
  until nums.length < interval
    nums.shift(interval).reverse.each { |num| new_nums << num }
  end
  
  nums.each { |num| new_nums << num }
  return new_nums.join(',')
end


File.open(ARGV[0]).each_line do |line|
  line.delete!("\n")
  numstring, interval = line.split(';')
  nums = numstring.split(',').map {|num| num.to_i}
  puts reverse(nums, interval.to_i)
end
