require 'pry'

class Move
  attr_reader :value
  VALUES = %w(rock paper scissors lizard spock).freeze
  RULES = { rock: [:scissors, :lizard],
            paper: [:rock, :spock],
            scissors: [:paper, :lizard],
            spock: [:rock, :scissors],
            lizard: [:paper, :spock] }.freeze

  def initialize(value)
    @value = value
  end

  def >(other_move)
    RULES[value.to_sym].include?(other_move.to_sym)
  end

  def <(other_move)
    !RULES[value.to_sym].include?(other_move.to_sym) &&
      value != other_move.to_s
  end

  def winning_choices
    Move::RULES.select { |_move, arr| arr.include?(value.to_sym) }.keys
  end

  def to_s
    value.to_s
  end

  def to_sym
    value.to_sym
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    reset_score
  end

  def reset_score
    self.score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp.capitalize
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    puts "Please choose rock, paper, scissors, lizard or spock:"
    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny Number\ 5).sample
  end

  def choose
    possible_move = RPSGame.human_patterns
    if possible_move
      self.move = possible_move.winning_choices.sample
    else
      self.move = Move.new(Move::VALUES.sample)
    end
  end
end

# Game Engine
class RPSGame

  @move_history = []
  WIN_CONDITION = 5
  PATTERN_THRESHOLD = 1.25 / Move::RULES.length.to_f

  class << self
    attr_accessor :move_history

    def human_move(num)
      move_history[num][:human_move].value
    end

    def human_patterns
      return nil if move_history.length < 2
      # creates empty hash whose default value is another empty hash
      # whose default value is 0, i.e. {:default => {:default => 0}}
      patterns = Hash.new { |hash, key| hash[key] = Hash.new(0) }

      (move_history.length - 1).times do |i|
        # increments the value in the nested hash to represent the
        # number of times a sequence of two moves was repeated, i.e.
        # { 'rock' => { 'rock' => 2 , 'paper' => 1 },
        #   'paper' => { 'rock' => 1, 'scissors' => 3 } }
        patterns[human_move(i)][human_move(i + 1)] += 1
      end

      # number of times human has made that move, using inject on the nested hash
      total_occurences = patterns[human_move(-1)].inject(0) { |sum, (_k, v)| sum + v }

      # move that most often followed the most recent human move, i.e. ['rock', 2]
      likely_move = patterns[human_move(-1)].max_by { |_k, v| v }

      if likely_move
        likely_ratio = likely_move.last / total_occurences.to_f
        return Move.new(likely_move.first) if likely_ratio > PATTERN_THRESHOLD
      else
        return nil
      end
    end
  end

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "#{human.name} vs #{computer.name}"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def game_over?
    human.score == WIN_CONDITION || computer.score == WIN_CONDITION
  end

  def display_winner
    if winner == human
      puts "#{human.name} won!"
    elsif winner == computer
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def winner
    if human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    end
  end

  def update_score
    if winner == human
      human.score += 1
    elsif winner == computer
      computer.score += 1
    end
  end

  def update_move_history
    self.class.move_history << { human_move: human.move,
                                 computer_move: computer.move,
                                 winner: winner }
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n."
    end
    return false if answer == 'n'
    return true if answer == 'y'
  end

  def play
    display_welcome_message

    loop do
      until game_over?
        human.choose
        computer.choose
        display_moves
        display_winner
        update_score
        update_move_history
      end
      display_score
      human.reset_score
      computer.reset_score
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
