class WordProblem
  OPERATORS = { "plus" => :+,
                 "minus" => :-,
                 "multiplied by" => :*,
                 "divided by" => :/ }

  def initialize(phrase)
    @numbers = phrase.scan(/[-]?\d+/).map(&:to_i)
    @operators = phrase.scan(/plus|minus|multiplied\ by|divided\ by/)
    raise ArgumentError, "Invalid question." if @numbers.empty? || @operators.empty?
  end

  def answer
    result = @numbers.first
    @numbers.length.times do |i|
      result = result.send(OPERATORS[@operators[i]], @numbers[i+1]) if @numbers[i+1]
    end
    result
  end
end
