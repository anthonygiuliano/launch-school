def has_a_b_1?(string)
  if string =~ /b/
    puts "We have a match!"
  else
    puts "No match here."
  end
end

def has_a_b_2?(string)
  if /b/.match(string) 
    puts "We have a match!"
  else
    puts "No match here."
  end
end


has_a_b_1?("basketball")
has_a_b_1?("football")
has_a_b_1?("hockey")
has_a_b_1?("golf")

has_a_b_2?("basketball")
has_a_b_2?("football")
has_a_b_2?("hockey")
has_a_b_2?("golf")
