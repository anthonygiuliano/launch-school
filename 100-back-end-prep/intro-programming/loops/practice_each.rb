names = ["bob", "joe", "steve", "janice", "susan", "helen"]
x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end
