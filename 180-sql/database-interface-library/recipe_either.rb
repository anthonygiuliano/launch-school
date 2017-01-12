class Recipe
  attr_accessor :name, :ingredients, :instructions

  def initialize(name, &block)
    self.name = name
    self.ingredients = []
    self.instructions = []

    if block_given?
      if block.arity == 1
        yield self
      else
        instance_eval &block
      end
    end
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
    output << "\n"
  end
end

eval_mac_and_cheese = Recipe.new("Eval Mac and Cheese") do
  ingredient "Noodles", amount: "2 cups"
  ingredient "Water", amount: "1 cup"
  ingredient "Cheese", amount: "1/2 cup"

  step "Boil water.", for: "5 minutes"
  step "Add noodles to boiling water.", for: "6 minutes"
  step "Drain water."
  step "Mix in cheese with noodles."
end

puts eval_mac_and_cheese

yield_mac_and_cheese = Recipe.new("Yield Mac and Cheese") do |m|
  m.ingredient "Noodles", amount: "2 cups"
  m.ingredient "Water", amount: "1 cup"
  m.ingredient "Cheese", amount: "1/2 cup"

  m.step "Boil water.", for: "5 minutes"
  m.step "Add noodles to boiling water.", for: "6 minutes"
  m.step "Drain water."
  m.step "Mix in cheese with noodles."
end

puts yield_mac_and_cheese
