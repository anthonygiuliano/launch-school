statement = "The Flintstones Rock!"

count = 0
statement.each_char { |char| count += 1 if char == 't' }

puts count