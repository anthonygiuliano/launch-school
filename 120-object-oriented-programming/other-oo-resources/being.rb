class Being
  @@count = 0

  def initialize
    @@count += 1
    puts "Being is created"
  end

  def show_count
    "There are #{@@count} beings"
  end
end

class Human < Being
  def initialize
    super
    puts "Human is created"
  end
end

class Animal < Being
  def initialize
    super
    puts "Animal is created"
  end
end

class Dog < Animal
  def initialize
    super
    puts "Dog is created"
  end
end

puts "Being"
b1 = Being.new
puts "Human"
h1 = Human.new
puts "Animal"
a1 = Animal.new
puts "Dog"
d1 = Dog.new

p Being.ancestors
p Human.ancestors
p Animal.ancestors
p Dog.ancestors

puts d1.show_count
