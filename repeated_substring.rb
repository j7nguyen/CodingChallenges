# CHALLENGE DESCRIPTION:
#
# You are to find the longest repeated substring in a given text. Repeated substrings may not overlap. If more than one substring is repeated with the same length, print the first one you find.(starting from the beginning of the text).
# NOTE: The substrings can't be all spaces.
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. The input file contains several lines. Each line is one test case. Each line contains a test string. E.g.
#
# banana
# am so uniqe
# OUTPUT SAMPLE:
#
# For each set of input produce a single line of output which is the longest repeated substring. If there is none, print out the string NONE. E.g.
#
# an
# NONE

def repeated_substring(string)
  longest_sub, ls_pos = "", string.length
  (1..(string.length/2)).each do |sslength|
    (0...(string.length - sslength)).each do |start_pos|
      substrings = [string[start_pos...(start_pos + sslength)]]
      current_pos = start_pos + sslength
      until current_pos > string.length - sslength
        substrings << string[current_pos...(current_pos + sslength)]
        current_pos += 1
      end

      checker = substrings.shift
      if substrings.include?(checker)
        if checker.length > longest_sub.length ||
        (checker.length == longest_sub.length && string.index(checker) < ls_pos)
          longest_sub, ls_pos = checker, string.index(checker)
        end
      end

    end
  end
  
  if longest_sub.length > 0 && !(longest_sub.delete(" ") == "")
    return longest_sub 
  else
    return "NONE"
  end
end

File.open(ARGV[0]).each_line do |line|
  puts repeated_substring(line.delete("\n"))
end
