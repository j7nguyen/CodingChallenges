REQUIREMENTS = {
  0 => [1,1,1,1,1,1,0,0],
  1 => [0,1,1,0,0,0,0,0],
  2 => [1,1,0,1,1,0,1,0],
  3 => [1,1,1,1,0,0,1,0],
  4 => [0,1,1,0,0,1,1,0],
  5 => [1,0,1,1,0,1,1,0],
  6 => [1,0,1,1,1,1,1,0],
  7 => [1,1,1,0,0,0,0,0],
  8 => [1,1,1,1,1,1,1,0],
  9 => [1,1,1,1,0,1,1,0]
}

def check_display(str)
  disp_string, num_string = str.split(";")
  disp_digits = disp_string.split(" ").map{|digit| digit.split("").map{|dig| dig.to_i}}
  num_digits = num_string.split("")
  if num_digits.include?(".")
    return 0 if num_digits.length > 13
  else
    return 0 if num_digits.length > 12
  end
  until num_digits.empty?
    next_disp = disp_digits.shift
    next_char = num_digits.shift
    next_digit = REQUIREMENTS[next_char.to_i].dup
    if num_digits[0] == "."
      num_digits.shift
      next_digit[-1] = 1
    end

    (0..8).each do |pos|
      return 0 if next_digit[pos] == 1 && next_disp[pos] == 0
    end
  end
  1
end

File.open(ARGV[0]).each_line do |line|
  puts line
  puts check_display(line.delete("\n"))
end