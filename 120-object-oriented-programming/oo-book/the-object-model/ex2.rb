# modules are bundles of related methods that can be
# included in one or more class. They extend the
# functionality of classes and avoids duplication
# that would come from adding the same functionality
# to more than one class that needs it

require_relative 'ex1'

module MyModule
  def say_hello
    puts "Hello"
  end
end

class MyClass
  include MyModule
end

my_object = MyClass.new
my_object.say_hello
my_object.say_hi