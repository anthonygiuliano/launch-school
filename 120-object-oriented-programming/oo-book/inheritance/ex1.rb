  # Create a superclass called Vehicle for your MyCar class to inherit from and
  # move the behavior that isn't specific to the MyCar class to the
  # superclass. Create a constant in your MyCar class that stores information
  # about the vehicle that makes it different from other types of Vehicles.

  # Then create a new class called MyTruck that inherits from your superclass
  # that also has a constant defined that separates it from the MyCar class in
  # some way.

module Towable
  def tow
    puts "I'm towing"
  end
end

class Vehicle
  attr_accessor :color, :model, :year
  @@vehicle_count = 0

  def self.display_vehicle_count
    puts "There are #{@@vehicle_count} vehicles."
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons.to_f} miles per gallon of gas."
  end

  def initialize(y=1960, c="red", m="mustang")
    @year = y
    @color = c
    @model = m
    @current_speed = 0
    @@vehicle_count += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brakes and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def age
    "Your #{self.model} is #{calculate_age} years old."
  end

  private

    def calculate_age
      Time.now.year - self.year
    end
end

class MyCar < Vehicle
  WHEELS = 4
  def to_s
    puts "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyTruck < Vehicle
  include Towable
  WHEELS = 4

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
MyCar.gas_mileage(13, 351)
lumina.spray_paint("red")
puts lumina
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

puts lumina.age