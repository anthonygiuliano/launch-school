# Add a class method to your MyCar class that calculates the gas mileage of
# any car

class MyCar
  attr_accessor :color, :model
  attr_reader :year

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons.to_f} miles per gallon of gas."
  end

  def initialize(y=1960, c="red", m="mustang")
    @year = y
    @color = c
    @model = m
    @current_speed = 0
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

  def to_s
    puts "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end