class Person
  attr_accessor :name, :pets
  def initialize(name)
    @name = name
    @pets = []
  end
end

class Bulldog
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

bob = Person.new('Robert') # => #<Person:0x007f9ceb83c4f0 @name="Robert", @pets=[]>
bud = Bulldog.new # => #<Bulldog:0x007f9ceb837f40>
charlie = Bulldog.new # => #<Bulldog:0x007f9ceb837720>

bob.pets << bud
bob.pets << charlie

bob.pets # => [#<Bulldog:0x007f9ceb837f40>, #<Bulldog:0x007f9ceb837720>]

bob.pets.each { |pet| puts pet.speak }
