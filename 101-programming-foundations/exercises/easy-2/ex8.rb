flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.find_index { |flintstone| flintstone.start_with?("Be") }

