a = [1, 2, 3]

def mutate(array)
  array.pop
end

def no_mutate(array)
  array.last
end

p "Before no mutate method: #{a}"
no_mutate(a)
p "After no mutate method: #{a}"
p no_mutate(a)
p "After p no_mutate method:#{a}"

p "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"
p mutate(a)
p "After p mutate: #{a}"

