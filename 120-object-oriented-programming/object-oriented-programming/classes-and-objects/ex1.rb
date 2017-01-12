class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob') # => #<Person:0x007feb84812280 @name="bob">
bob.name # => "bob"
bob.name = 'Robert' # => "Robert"
bob.name # => "Robert"
