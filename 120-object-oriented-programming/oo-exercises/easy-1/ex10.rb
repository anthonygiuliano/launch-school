class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

my_bag = Bag.new("red", "leather") # => #<Bag:0x007f9be48a2898 @color="red", @material="leather"> # !> assigned but unused variable - my_bag
