def check_doubles(int)
  max_try = Math.sqrt(int / 2)
  count = 0
  (0..max_try).each do |checker|
    result = Math.sqrt(int - checker**2)
    p checker
    if result % 1 == 0
      count += 1
      p "yeah!"
    else
      p "NO"
    end
  end
  p count
end

check_doubles(10002)

