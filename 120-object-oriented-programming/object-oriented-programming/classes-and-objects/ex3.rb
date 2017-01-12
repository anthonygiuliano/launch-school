class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parse_name(name)
  end

  private

    def parse_name(name)
      parts = name.split
      self.first_name = parts.first
      self.last_name = parts.size > 1 ? parts.last : ''
    end
end

bob = Person.new('Robert') # => #<Person:0x007fd6b5075510 @first_name="Robert", @last_name="">
bob.name # => "Robert"
bob.first_name # => "Robert"
bob.last_name # => ""
bob.last_name = 'Smith' # => "Smith"
bob.name # => "Robert Smith"

bob.name = 'John Adams'
bob.first_name # => "John"
bob.last_name # => "Adams"

bob.name = 'Bob'
bob.first_name # => "Bob"
bob.last_name # => ""
