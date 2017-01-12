# https://launchschool.com/lessons/c0400a9c/assignments/3807

[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

# Above is equivalent to below

[1, 2, 3, 4, 5].map(&:to_s) # => ["1", "2", "3", "4", "5"]

# New array is returned because of map, therefore can chain array methods like so...

[1, 2, 3, 4, 5].map(&:to_s).map(&:to_i) # => [1, 2, 3, 4, 5]

# This shortcut works on any collection method that takes a block

["hello", "world"].each(&:upcase!) # => ["HELLO", "WORLD"]
[1, 2, 3, 4, 5].select(&:odd?) # => [1, 3, 5]
[1, 2, 3, 4, 5].select(&:odd?).any?(&:even?) # => false

# adding '&' in front of an object causes Ruby to try converting the object to a block. Therefore it expects a Proc object. If it's not a Proc, it calls Symbol#to_proc

def my_method
  yield(2)
end

my_method(&:to_s) # => "2"

a_proc = :to_s.to_proc
my_method(&a_proc) # => "2"

# blocks are just one way Ruby implements closures. Procs and lambdas are others (and less common)
# closures drag their surrounding context/environment around, and this is at the core of how variable scope works
# blocks are great for pushing some decisions to method invocation time
# blocks are great for wrapping logic, where you need to perform some before/after actions
# we can write our own methods that take a block with the `yield` keyword
# when we `yield`, we can also pass arguments to the block
# when we `yield`, we have to be aware of the block's return value
# once we understand blocks, we can re-implement many of the common methods in the Ruby standard library in our own classes
# the `Symbol#to_proc` is a nice shortcut when working with collections
