class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def public_disclosure
    "#{self.name} in human years is #{human_years}."
  end

  private

    def human_years
      self.age / DOG_YEARS
    end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.public_disclosure

class Animal
  def public_method
    "Will this work? " + self.protected_method
  end

  protected

    def protected_method
      "Yes, I'm protected!"
    end
end

pepper = Animal.new

puts pepper.public_method

puts Animal.superclass