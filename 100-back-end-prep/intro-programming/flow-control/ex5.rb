def num_eval(num)
  case
    when num >= 0 && num <= 50
      puts "#{num} is between 0 and 50"
    when num > 50 && num <= 100
      puts "#{num} is between 51 and 100"
    when num > 100
      puts "#{num} is greater than 100"
    else
      puts "#{num} is less than 0"
  end
end

puts "Give me a number between 0 and 100"
num = gets.chomp.to_i

num_eval(num)
