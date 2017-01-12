def all_caps(string)
  if string.length > 10
    string.upcase
  else
    string
  end
end

p all_caps("hello world")
p all_caps("hi")
