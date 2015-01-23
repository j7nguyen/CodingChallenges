def capitalize_words(str)
  words = str.split
  words.each do |word|
    word[0] = word[0].capitalize
  end
  words.join(" ")
end

p capitalize_words("javaScript language")