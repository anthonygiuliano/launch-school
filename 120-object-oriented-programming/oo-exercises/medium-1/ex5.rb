class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    result = ''
    if @filling_type
      result << @filling_type
    else
      result << "Plain"
    end

    if @glazing
      result << " with #{@glazing}"
    end

    result
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => nil

puts donut2
  # => nil

puts donut3
  # => nil

puts donut4
  # => nil

puts donut5
  # => nil
# >> Plain
# >> Vanilla
# >> Plain with sugar
# >> Plain with chocolate sprinkles
# >> Custard with icing
