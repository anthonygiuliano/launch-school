module Limitable
  def max_factor
    @limits[:max_factor]
  end

  def min_factor
    @limits[:min_factor] || 1
  end
end

class Palindromes
  attr_accessor :palindrome_array

  include Limitable

  def initialize(factor_limits)
    @limits = factor_limits
  end

  def generate
    arr = (min_factor..max_factor).to_a
    arr_product = arr.product(arr.reverse)
    @palindrome_array = arr_product.map do |arr|
      product = arr.first * arr.last
      PalindromeNumber.new(product, @limits) if palindrome?(product)
    end.compact.uniq{|p| p.value}.sort
  end

  def largest
    @palindrome_array.last
  end

  def smallest
    @palindrome_array.first
  end

  private

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end

end

class PalindromeNumber
  include Limitable

  attr_reader :value

  def initialize(value, limits)
    @value = value
    @limits = limits
  end

  def <=>(other)
    @value <=> other.value
  end

  def factors
    factors = []
    (min_factor..max_factor).each do |num|
      if value % num == 0 && value / num < max_factor
        factors << [num, value / num].sort if value % num == 0
      end
    end
    factors.uniq
  end
end
