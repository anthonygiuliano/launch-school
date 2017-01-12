class GoodDog
  # Constant
  DOG_YEARS = 7
  attr_accessor :name, :height, :weight, :age
  # Class variable with @@
  @@number_of_dogs = 0

  def initialize(n, h, w, a)
    self.name = n
    self.height = h
    self.weight = w
    self.age = a * DOG_YEARS
    # Shows that class variables can be accessed in instance
    # methods
    @@number_of_dogs += 1
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end

  def speak
    "#{name} says Arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end

  # Class methods
  def self.what_am_i
    "I'm a GoodDog class!"
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.what_am_i
puts GoodDog.total_number_of_dogs

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs', 3)
puts sparky.age

fido = GoodDog.new('Fido', '20 inches', '30 lbs', 2)
puts fido.age

puts GoodDog.total_number_of_dogs

puts sparky
p sparky