class Array
  def my_select
    new_arr = []
    self.each { |e| new_arr.push(e) if yield(e) }
    new_arr
  end
end

[1,2,3,4].my_select {|num| num.odd? }
