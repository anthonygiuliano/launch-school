puts "What's your first name?"
first_name = gets.chomp
puts "What's your last name?"
last_name = gets.chomp
name = first_name + " " + last_name

puts "Hello #{name}!"

10.times { puts name }
