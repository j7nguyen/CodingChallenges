def can_hop?(ints)
  current_pos = 0
  while current_pos + ints[current_pos] < ints.length - 1
    return false if ints[current_pos] == 0
    next_pos = current_pos
    min, max = next_pos, next_pos + ints[next_pos]
    (min..max).each do |pos|
      if pos + ints[pos] >= next_pos + ints[next_pos]
        next_pos = pos
      end
    end
    current_pos = next_pos
    p current_pos, ints[current_pos]
  end
  true
end