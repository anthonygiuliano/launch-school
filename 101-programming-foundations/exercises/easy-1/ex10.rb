flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flin_hash = {}
flintstones.each_with_index do |v,i|
  flin_hash[v] = i
end

p flin_hash