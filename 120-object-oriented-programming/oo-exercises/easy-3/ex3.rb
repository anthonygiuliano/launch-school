class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

tom = AngryCat.new(5, "tom")
jerry = AngryCat.new(3, "jerry")

tom.name
tom.age

jerry.name
jerry.age
# >> tom
# >> 5
# >> jerry
# >> 3
