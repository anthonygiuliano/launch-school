###########################
# Initializing a new object
###########################

class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new

####################
# Instance Variables
####################

class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")

###################
 # Instance Methods
###################

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
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

  def some_method
    self.info
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info

puts sparky.some_method