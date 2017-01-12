a = { one: 1, two: 2, three: 3 }

a.each_key do |key|
  puts key
end

a.each_value do |value|
  puts value
end

a.each do |value, key|
  puts "#{key}: #{value}"
end
