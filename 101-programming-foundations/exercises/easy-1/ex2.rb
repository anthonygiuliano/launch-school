# Question 2

# Describe the difference between ! and ? in Ruby. And explain what would
  # happen in the following scenarios: 1. what is != and where should you use
  # it? 2. put ! before something, like !user_name 3. put ! after something,
  # like words.uniq! 4. put ? before something 5. put ? after something 6.
  # put !! before something, like !!user_name

# ! negates a boolean value. It's also a convention to indicate that a method
  # is destructive. ? is a naming convention to indicate that a method
  # returns a boolean value

# != is a comparison operator that means "not equal to"

# ! before a variable like !user_name would return its "truthiness", i.e.
  # if user_name is nil or false, !user_name would return true, and false
  # otherwise

# word.uniq! would return an array with duplicates removed, and it would also
  # change the original array

#

# ? after a method name would indicate that the method returns a boolean
  # value

# !! before something would return its "truthiness"