require 'faker'

class Board
  attr_reader :squares
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def [](num)
    @squares[num]
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won_round?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " ".freeze

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  class << self
    def reset_scores
      ObjectSpace.each_object(self) { |player| player.score = 0 }
    end
  end

  attr_accessor :score, :marker, :name

  def initialize(marker, name = nil)
    @marker = marker
    @score = 0
    @name = name
  end

  def add_point
    self.score += 1
  end

  # rubocop:disable Style/AccessorMethodName # rubocop:enable Style/AccessorMethodName
  def get_marker
    puts "Your marker is 'X' by default. Enter a new marker now, or just hit 'enter' to use the default."
    answer = gets.chomp.upcase.chars.first
    self.marker = answer if answer
  end

  def get_name
    puts "Please enter your name, or just hit 'enter' to use a randomly generated name."
    answer = gets.chomp.capitalize
    if answer.empty?
      self.name = Faker::Name.name
    else
      self.name = answer
    end
  end

  def get_details
    get_marker
    get_name
  end
  # rubocop:enable Style/AccessorMethodName # rubocop:enable Style/AccessorMethodName
end

class TTTGame
  HUMAN_MARKER = "X".freeze
  COMPUTER_MARKER = "O".freeze
  FIRST_TO_MOVE = 'human'.freeze
  WINNING_SCORE = 5

  attr_accessor :current_player
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER, Faker::Name.name)
    @current_player = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    human.get_details

    # main loop
    loop do
      # score loop
      loop do
        display_board

        # move loop
        loop do
          current_player_moves
          clear_and_display_board
          break if board.someone_won_round? || board.full?
        end
        update_score
        display_result
        display_score
        board.reset
        break if someone_won_game?
        puts "Press 'enter' to continue..."
        gets
        clear
      end
      break unless play_again?
      Player.reset_scores
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def update_score
    case board.winning_marker
    when human.marker
      human.add_point
    when computer.marker
      computer.add_point
    end
  end

  def someone_won_game?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "First player to #{WINNING_SCORE} points wins!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_and_display_board
    clear
    display_board
  end

  def display_board
    display_game_title
    puts "You're #{human.marker}. Computer is #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def join_or(arr, delim = ', ', conj = 'or')
    arr[-1] = "#{conj} #{arr.last}" if arr.length > 1
    arr.join(delim)
  end

  def human_moves
    puts "Choose a square (#{join_or(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    if smart_move
      board[smart_move] = computer.marker
    elsif board[5].unmarked?
      board[5] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if current_player == 'human'
      human_moves
      self.current_player = 'computer'
    else
      computer_moves
      self.current_player = 'human'
    end
  end

  def display_result
    clear
    display_board
    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "The score is:"
    puts "You: #{human.score}"
    puts "Computer: #{computer.score}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def display_game_title
    puts "#{human.name} vs #{computer.name}"
  end

  def display_play_again_message
    clear
    puts "Let's play again!"
    puts ""
  end

  def two_markers?(squares, player)
    markers = squares.select { |square| square.marker == player.marker }
    empty_square = squares.select { |square| square.marker == Square::INITIAL_MARKER }
    markers.size == 2 && empty_square.size == 1
  end

  def smart_move
    move = nil
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line)
      if two_markers?(squares, computer)
        move = squares.select { |square| square.marker == Square::INITIAL_MARKER }
        return board.squares.key(move.first)
      elsif two_markers?(squares, human)
        move = squares.select { |square| square.marker == Square::INITIAL_MARKER }
      end
    end
    if move
      return board.squares.key(move.first)
    end
    nil
  end
end

game = TTTGame.new
game.play
