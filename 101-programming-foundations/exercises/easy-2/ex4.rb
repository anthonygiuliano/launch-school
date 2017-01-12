munsters_description = "The Munsters are creepy in a good way."

string1 = munsters_description.downcase.capitalize
answer1 = "The munsters are creepy in a good way."

string2 = munsters_description.swapcase
answer2 = "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

string3 = munsters_description.downcase
answer3 = "the munsters are creepy in a good way."

string4 = munsters_description.upcase
answer4 = "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

puts "#{string1} (#{string1 == answer1})"
puts "#{string2} (#{string2 == answer2})"
puts "#{string3} (#{string3 == answer3})"
puts "#{string4} (#{string4 == answer4})"