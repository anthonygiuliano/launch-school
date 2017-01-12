class GhostClass
  # inside of a class method
  def self.reflect
    self
  end

  # inside of an instance method
  def reflect
    self
  end
end

g = GhostClass.new

puts "Inside of an instance method: #{g.reflect == g}"

puts "Inside of a class method: #{GhostClass.reflect == GhostClass}"

module GhostMod
  # inside of a module class method
  def self.reflect
    self
  end
end

puts "Inside of a module class method: #{GhostMod.reflect == GhostMod}"

class GhostClass
  puts "Inside of a class definition: #{self == GhostClass}"
end

module GhostMod
  puts "Inside of a module definition: #{self == GhostMod}"
end

module GhostMod
  def reflect
    self
  end
end

class GhostInc
  include GhostMod
end

g = GhostInc.new
puts "Inside mixed-in methods: #{g.reflect == g}"

class GhostExt
  extend GhostMod
end

puts "Inside extended module: #{GhostExt.reflect == GhostExt}"

class GhostClass
  class << self
    def singleton_reflect
      self
    end
  end
end

puts "Inside the singleton class: #{GhostClass.singleton_reflect == GhostClass}"

class << "test"
  puts "self in the 'test' singleton class: #{self}"
end

puts "Outside of any class: #{self}"
