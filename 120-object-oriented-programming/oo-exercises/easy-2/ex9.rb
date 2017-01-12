class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Test"
  end
end

# if we add a play method to Bingo, it would override the play method
# from Game

Bingo.new.play # => "Test"
