# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

Fruit.new("apple").instance_variables # => []
Pizza.new("pepperoni").instance_variables # => [:@name]

# Pizza has an instance variable, @name
