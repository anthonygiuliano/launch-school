class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    # rules of play
  end
end

Bingo.new.play # => "Start the game!"