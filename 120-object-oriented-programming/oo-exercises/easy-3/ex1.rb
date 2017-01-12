class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi # should print "Hello"

# hello.bye # no method error

# hello.greet # wrong number of arguments

hello.greet("Goodbye") # should print "Goodbye"

# Hello.hi # no method error

# >> Hello
# >> Goodbye
