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

  def to_s
    self.name
  end

  private

    def parse_name(name)
      parts = name.split
      self.first_name = parts.first
      self.last_name = parts.size > 1 ? parts.last : ''
    end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

bob.name == rob.name # => true
puts "The person's name is: #{bob}"
