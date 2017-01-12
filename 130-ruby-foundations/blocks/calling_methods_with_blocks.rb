# Example 1: passing in a block to the 'Integer#times' method.

3.times do |num|
  puts num
end

# Example 2: passing in a block to the 'Array#map' method.

[1, 2, 3].map do |num|
  num + 1
end

# Example 3: passing in a block to the 'File#open' method.

File.open('tmp.txt', 'w') do |file|
  file.write('first line!')
end
