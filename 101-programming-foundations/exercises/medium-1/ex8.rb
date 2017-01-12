def titleize(string)
  string.scan(/\w+/).map { |word| word.capitalize }.join(' ')
end

p titleize("testing a multi word string")