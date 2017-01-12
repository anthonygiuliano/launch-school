a = "hi there"
b = a
a = "not here"

puts a
puts b

c = "hi there"
d = c
c << ", Bob"

puts c
puts d

# That shit cray

e = [1, 2, 3, 3]
f = e
g = e.uniq

puts e
puts f
puts g

h = [1, 2, 3, 3]
i = h
j = h.uniq!

puts h
puts i
puts j

# More cray

def test(k)
  k.map {|letter| "I like the letter: #{letter}"}
end

l = ['a','b','c']
p test(l)
puts l
