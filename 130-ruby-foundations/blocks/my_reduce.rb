class Array
  def my_reduce(acc = 0)
    self.each do |number|
      acc = yield(acc, number)
    end
    acc
  end
end
p [1, 2, 3, 4, 5].my_reduce { |acc, num| acc + num }
p [1, 2, 3, 4, 5].my_reduce(10) { |acc, num| acc + num }
# [1, 2, 3, 4, 5].my_reduce { |acc, num| acc + num if num.odd? }
