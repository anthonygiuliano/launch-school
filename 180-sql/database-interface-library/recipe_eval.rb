class Recipe
  attr_accessor :name, :ingredients, :instructions

  def initialize(name, &block)
    self.name = name
    self.ingredients = []
    self.instructions = []

    instance_eval &block
  end

  def ingredient(name, options = {})
    ingredient = name
    ingredient << " (#{options[:amount]})" if options[:amount]

    ingredients << ingredient
  end

  def step(text, options = {})
    instruction = text
    instruction << " (#{options[:for]})" if options[:for]

    instructions << instruction
  end

  def to_s
    output = name
    output << "\n#{'=' * name.size}\n\n"
    output << "Ingredients: #{ingredients.join(', ')}\n\n"

    instructions.each_with_index do |instruction, index|
      output << "#{index + 1}) #{instruction}\n"
    end
    output
  end
end

mac_and_cheese = Recipe.new("Mac and Cheese") do
  ingredient "Noodles", amount: "2 cups"
  ingredient "Water", amount: "1 cup"
  ingredient "Cheese", amount: "1/2 cup"

  step "Boil water.", for: "5 minutes"
  step "Add noodles to boiling water.", for: "6 minutes"
  step "Drain water."
  step "Mix in cheese with noodles."
end

puts mac_and_cheese
