a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

b = a.select do |num|
  num % 2 == 1  
end

p b
