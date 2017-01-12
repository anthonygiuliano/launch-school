class Car
  attr_reader :name, :price
  attr_writer :name, :price

  def to_s
    "#{@name}: #{@price}"
  end
end

c1 = Car.new
c2 = Car.new

c1.name = "Porsche"
c1.price = 23500

c2.name = "Volkswagen"
c2.price = 9500

puts "The #{c1.name} costs #{c1.price}"

puts c1
puts c2
