a = { one: 1, two: 2, three: 3 }
b = { four: 4, five: 5, six: 6 }

puts "return value of a.merge(b)"
p a.merge(b)
puts "return value of a after merge(b)"
p a
puts "return value of b after merge(b)"
p b

puts "return value of a.merge!(b)"
p a.merge!(b)
puts "return value of a after merge!(b)"
p a
puts "return value of b after merge!(b)"
p b
