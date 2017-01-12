class Array
  def my_each
    counter = 0
    while counter < self.length
      yield self[counter]
      counter += 1
    end
    self
  end
end

[1, 2, 3].my_each { |num| puts num + 1 }

[1, 2, 3].my_each { |num| "nothing" }.select { |num| num.odd? }
