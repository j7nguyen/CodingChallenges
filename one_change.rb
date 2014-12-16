def one_change?(str)
  a,b = str.split(",").sort_by{|string| string.length}

  return false if b.length - a.length > 1 || a == b
  if a.length == b.length
    count = 0
    (0...a.length).each do |pos|
      count += 1 if a[pos] != b[pos]
    end

    return false if count != 1
  else
    count = 0
    left, right = 0,0
    while right < b.length
      if a[left] == b[right]
        left += 1
        right += 1
      else
        count +=1
        right += 1
      end
    end
    return false if count != 1
  end
  true
end