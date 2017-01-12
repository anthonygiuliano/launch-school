require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
FIRST_MOVE = "choose".freeze

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(ary, delimiter=', ', conjunction = 'or')
  return ary.join if ary.length == 1
  new_ary = ary.join(delimiter).each_char.to_a
  new_ary.insert(-2, conjunction, ' ').join
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  
  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick 5
  if !square && empty_squares(brd).include?(5)
    square = 5
  end

  # random square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, score)
  !!detect_winner(brd, score)
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k,v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def detect_winner(brd, score)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player" 
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def update_score(winner, score)
  score << winner
end

def display_score(score)
  prompt "Player: #{score.count("Player")}, Computer: #{score.count("Computer")}"
end

def who_goes_first
  if FIRST_MOVE == "choose"
    prompt "Do you want to go first? (y or n)"
    answer = gets.chomp
    return current_player = "player" if answer.downcase.start_with?('y')
    return current_player = "computer"
  elsif FIRST_MOVE == "player"
    current_player = "player"
  else
    current_player = "computer"
  end
end

def alternate_player(current_player)
  return "computer" if current_player == "player"
  return "player" if current_player == "computer"
end

def place_piece!(brd, current_player)
  if current_player == "player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

prompt "Welcome to Tic Tac Toe!"
score = []

loop do
  board = initialize_board
  current_player = who_goes_first

  loop do
    display_board(board)

    place_piece!(board, current_player)

    current_player = alternate_player(current_player)
    break if someone_won?(board, score) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board, score)
    prompt "#{detect_winner(board, score)} won!"
    update_score(detect_winner(board, score), score)
  else
    prompt "It's a tie!"
  end

  display_score(score)
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing! Good bye"
