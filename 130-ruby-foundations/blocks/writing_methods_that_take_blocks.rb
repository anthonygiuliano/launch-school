def hello
  "hello!"
end

hello { puts 'hi' }

def echo_with_yield(str)
  yield if block_given?
  str
end

# echo_with_yield { puts "world" }
echo_with_yield("hello") { puts "world" }
# echo_with_yield("hello", "world!") { puts "world" }
echo_with_yield("hello!")

def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system 'clear'
end

def increment(number)
  if block_given?
    yield(number + 1)
  else
    number + 1
  end
end

increment(5) # => 6
increment(5) do |num|
  puts num
end

def test
  yield(1, 2)
end

test { |num| puts num } # => nil

def test2
  yield(1)
end

test2 { |num, num2| puts "#{num}, #{num2}" } # => nil

def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

compare('hello') { |word| word.upcase } # => nil

def test3(&block)
  puts "What's &block? #{block}"
end

test3 { sleep(1) }
