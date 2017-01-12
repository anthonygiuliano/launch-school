# create an object in Ruby with the ::new method

class MyClass
  def say_hi
    puts "Hi"
  end
end

my_arr = Array.new
p my_arr

my_str = String.new
p my_str

my_object = MyClass.new
p my_object

