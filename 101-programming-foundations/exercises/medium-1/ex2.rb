statement = "The Flintstones Rock"

flin_hash = Hash.new(0)

statement.each_char { |char| flin_hash[char] += 1 }

p flin_hash