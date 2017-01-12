class Prime
  def self.nth(num)
    raise ArgumentError, 'nth must be greater than 0' if num < 1
    count = 0
    i = 2
    loop do
      count += 1 if is_prime?(i)
      return i if count == num
      i += 1
    end
  end

  private

    def self.is_prime?(num)
      return false if num == 0 || num == 1
      max = Math::sqrt(num).to_i
      !!(2..max).each { |test| return false if num % test == 0 }
    end
end