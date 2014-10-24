# Write a program which swaps letters' case in a sentence. All non-letter characters should remain the same.
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. Input example is the following
#
# Hello world!
# JavaScript language 1.8
# A letter
# 
# OUTPUT SAMPLE:
#
# Print results in the following way.
#
# hELLO WORLD!
# jAVAsCRIPT LANGUAGE 1.8
# a LETTER

lines = []
uppercase_letters = ('A'..'Z').to_a
lowercase_letters = ('a'..'z').to_a
File.open(ARGV[0]).each_line do |line|
  lines << line.delete("\n")
end

lines.each do |line|
  output_string = ""
  line.each_char do |char|
    if uppercase_letters.include?(char)
      output_string << char.downcase
    elsif lowercase_letters.include?(char)
      output_string << char.upcase
    else
      output_string << char
    end
  end
  puts output_string
end