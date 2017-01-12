class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n="Sparky", h="20 inches", w="20 lbs")
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end

  def self.class_method
    self
  end
end