level_1 = "outer-most variable"

[1, 2, 3].each do |n|               # block creates a new scope
  level_2 = "inner variable"

  ['a', 'b', 'c'].each do |n2|      # nested block creates a nested scope
    level_3 = "inner-most variable"

    # all three level_x variables are accessible here

    level_1
    level_2
    level_3
  end

  # level_1 is accessible here
  # level_2 is accessible here
  # level_3 is not accessible here

  level_1
  level_2

end

# level_1 is accessible here
# level_2 is not accessible here
# level_3 is not accessible here

level_1

##
##
##

def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new { puts "hi #{name}" }
name = "Griffin III"

call_me(chunk_of_code)
