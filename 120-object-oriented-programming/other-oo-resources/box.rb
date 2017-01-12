class Box
  # print class information
  puts "Type of self = #{self.class}"
  puts "Name of self = #{self.name}"

  def initialize(w=40, h=60)
    self.width = w
    self.height = h
  end

  def width
    @width
  end

  def width=(width)
    @width = width
  end

  def height
    @height
  end

  def height=(height)
    @height = height
  end

  def self.what_is_self
    self
  end

  def what_is_self
    self
  end

  def print_area
    puts "My area is #{area}"
  end

  private

    def area
      self.width * self.height
    end
end
