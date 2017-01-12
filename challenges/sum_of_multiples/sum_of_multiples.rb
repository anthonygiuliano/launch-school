class SumOfMultiples
  @@multiples = []

  def initialize(*nums)
    @@multiples = nums.sort
  end

  def self.to(num)
    multiples = @@multiples.empty? ? [3, 5] : @@multiples
    self.reset_multiples
    (1..num-1).select do |number|
      multiples.any? do |divisor|
        number % divisor == 0
      end
    end.inject(0, &:+)
  end

  def to(num)
    self.class.to(num)
  end

  def self.reset_multiples
    @@multiples = []
  end
end
