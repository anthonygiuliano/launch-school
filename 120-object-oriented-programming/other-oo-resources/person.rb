class Person
  def initialize name
    @name = name
  end

  def get_name
    @name
  end
end

p1 = Person.new "Jane"
p2 = Person.new "Beky"

puts p1.get_name
puts p2.get_name

puts p1.send :get_name
