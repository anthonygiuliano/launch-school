module Mammal
  def self.some_method(num)
    num ** 2
  end
end

value = Mammal.some_method(4)
puts value
another = Mammal::some_method(4)
puts another