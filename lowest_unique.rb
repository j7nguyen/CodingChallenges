def lowest_unique(str)
   nums = str.split(" ").map{|char| char.to_i}
   pos_lowest, lowest = 0, nil
   nums.each do |num|
       next if nums.count(num) > 1
       if !lowest || num < lowest
           pos_lowest, lowest = nums.index(num) + 1, num
       end
   end
   pos_lowest
end

File.open(ARGV[0]).each_line do |line|
  line.delete!("\n")
  puts lowest_unique(line)
end