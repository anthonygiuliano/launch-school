class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob" # => undefined method `name='

#error occurs because there's no setter method
# change attr_reader to attr_accessor to fix
