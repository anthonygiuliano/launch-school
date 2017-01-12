module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming"
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I walk!"
  end
end

class Dog < Animal
  include Swimmable

  def speak
    "I'm a dog, and I swim and walk!"
  end
end

puts "---Animal method lookup---"
puts Animal.ancestors

puts "---Dog method lookup---"
puts Dog.ancestors

fido = Dog.new
puts fido.speak
puts fido.swim
puts fido.walk
