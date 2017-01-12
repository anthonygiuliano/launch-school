class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parts = name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert') # => #<Person:0x007fea79971740 @first_name="Robert", @last_name="">
bob.name # => "Robert"
bob.first_name # => "Robert"
bob.last_name # => ""
bob.last_name = 'Smith' # => "Smith"
bob.name # => "Robert Smith"

bob.name = 'John Adams'
bob.first_name # =>
bob.last_name # =>
# ~> -:15:in `name=': undefined local variable or method `full_name' for #<Person:0x007fea79971740> (NameError)
# ~>  from -:28:in `<main>'
