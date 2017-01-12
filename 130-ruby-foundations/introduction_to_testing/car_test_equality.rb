# https://launchschool.com/lessons/dd2ae827/assignments/3815

# assert_equal compares values
# assert_same compares objects themselves (object id)

# assert_equal uses #== method, so comparing custom objects for value will rely on custom implementation of this method

require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'car'

Minitest::Reporters.use!

class CarTest < Minitest::Test
  def test_value_equality
    str1 = 'hi there'
    str2 = 'hi there'

    assert_equal(str1, str2)
    refute_same(str1, str2)
  end

  def test_car_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = 'Kim'
    car2.name = 'Kim'

    assert_equal(car1, car2)
  end
end
