def scream_return(words)
  words = words + "!!!!"
  return
  puts words
end

def scream_nil(words)
  words = words + "!!!!"
  puts words
  return
end

scream_return("Yippeee") # Should print nothing
scream_nil("Yippeee") # Should print "Yippeee!!!!"
