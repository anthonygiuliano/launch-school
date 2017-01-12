# instance variables are inherited by subclasses

class Animal
  def initialize(name)
    @name = name
  end
end

module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog < Animal
  include Swim

  def swim
    "swimming!" if @can_swim
  end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
teddy.dog_name # => "bark! bark! Teddy bark! bark!"

teddy.enable_swimming
teddy.swim # => "swimming!"

class Animal2
  @@total_animals = 0

  def initialize
    @@total_animals += 1
  end
end

class Dog2 < Animal2
  def total_animals
    @@total_animals
  end
end

spike = Dog2.new
spike.total_animals # => 1

# sub classes access and modify the same class variable from the parent

class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels # => 4

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels # => 2
Vehicle.wheels # => 2

class Car < Vehicle
end

Car.wheels # => 2

# Constants are only available in the class and its subclasses,
# but can be accessed by namespacing

class Dog3
  LEGS = 4
end

class Puppy3 < Dog3
  def legs
    LEGS
  end
end

class Cat3
  def legs
    Dog3::LEGS
  end
end

kitty = Cat3.new
kitty.legs # => 4

pip = Puppy3.new
pip.legs # => 4
