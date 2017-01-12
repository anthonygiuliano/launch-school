require 'pry'
require 'faker'

class Board
  SIZE = 5
  MARKERS = {empty: ' ',
             hit: 'X',
             miss: '/' }
  attr_reader :ships, :squares, :destroyer

  def initialize
    @destroyer, @cruiser, @battleship = Destroyer.new, Cruiser.new, Battleship.new
    @ships = [@destroyer, @cruiser, @battleship]
    begin
      @ships.each { |ship| place_ship(ship) }
    end until valid_board?
    @board_squares = []
    SIZE.times { |i| SIZE.times { |j| @board_squares << Square.new(i + 1, j + 1) unless ship_coordinates.include?([i + 1, j + 1]) } }
  end

  def place_ship(ship)
    ship.squares = []

    if ship.direction == :horizontal
      x_max = SIZE - ship.size + 1
      y_max = SIZE
    elsif ship.direction == :vertical
      x_max = SIZE
      y_max = SIZE - ship.size + 1
    end

    x = (1..x_max).to_a.sample
    y = (1..y_max).to_a.sample

    ship.size.times do
      ship.squares << Square.new(x, y)
      x += 1 if ship.direction == :horizontal
      y += 1 if ship.direction == :vertical
    end
  end

  def valid_board?
    ship_coordinates = []
    @ships.each { |ship| ship.squares.each { |square| ship_coordinates << square.coordinates } }
    ship_coordinates == ship_coordinates.uniq
  end

  def display
    puts "    1   2   3   4   5"
    puts "  +---+---+---+---+---+"
    puts "1 | #{marker_at(1,1)} | #{marker_at(2,1)} | #{marker_at(3,1)} | #{marker_at(4,1)} | #{marker_at(5,1)}"
    puts "  +---+---+---+---+---+"
    puts "2 | #{marker_at(1,2)} | #{marker_at(2,2)} | #{marker_at(3,2)} | #{marker_at(4,2)} | #{marker_at(5,2)}"
    puts "  +---+---+---+---+---+"
    puts "3 | #{marker_at(1,3)} | #{marker_at(2,3)} | #{marker_at(3,3)} | #{marker_at(4,3)} | #{marker_at(5,3)}"
    puts "  +---+---+---+---+---+"
    puts "4 | #{marker_at(1,4)} | #{marker_at(2,4)} | #{marker_at(3,4)} | #{marker_at(4,4)} | #{marker_at(5,4)}"
    puts "  +---+---+---+---+---+"
    puts "5 | #{marker_at(1,5)} | #{marker_at(2,5)} | #{marker_at(3,5)} | #{marker_at(4,5)} | #{marker_at(5,5)}"
    puts "  +---+---+---+---+---+"
    puts ''
    display_ship_status
  end

  def display_ship_status
    puts "Destroyer: #{@destroyer.status} || Cruiser: #{@cruiser.status} || Battleship #{@battleship.status}"
  end

  def marker_at(x, y)
    square = square_at(x, y)
    square ? MARKERS[square_at(x, y).status] : MARKERS[:empty]
  end

  def square_at(x, y)
    all_squares.find { |square| square.coordinates == [x, y] }
  end

  def ship_squares
    @ships.map(&:squares).flatten(1)
  end

  def ship_coordinates
    ship_squares.map(&:coordinates)
  end

  def all_squares
    @board_squares + ship_squares
  end

  def empty_square_coordinates
    all_squares.select { |square| square.status == :empty }.map(&:coordinates)
  end

  def fire_at!(square)
    if ship_squares.include?(square)
      square.status = :hit
    else
      square.status = :miss
    end
  end

  def lost?
    @ships.all? { |ship| ship.status == 'Sunk' }
  end
end

class Square
  attr_accessor :status
  attr_reader :coordinates

  def initialize(x, y)
    @status = :empty
    @coordinates = [x, y]
  end

  def ==(other)
    @coordinates == other.coordinates
  end
end

class Player
  attr_reader :board, :name

  def initialize
    @board = Board.new
  end
end

class Human < Player
  def fire!(other_board)
    puts "Please enter coordinates to fire at."
    response = nil
    x = nil
    y = nil
    loop do
      response = gets.gsub(/\D/,'').scan(/\d/).map(&:to_i)
      x, y = response.first, response.last
      unless response.length == 2 && (1..Board::SIZE) === x && (1..Board::SIZE) === y
        puts "Invalid response. Please enter two numbers between 1 and 5"
        next
      end
      unless other_board.empty_square_coordinates.include?([x, y])
        puts "Invalid choice. Choose coordinates that haven't been fired at."
        next
      end
      break
    end
    square = other_board.square_at(x, y)
    other_board.fire_at!(square)
  end

  def get_name
    puts "Please enter your name, or press enter for a random name."
    response = gets.chomp
    @name = response == '' ? Faker::Name.name : response
  end
end

class Computer < Player
  def initialize
    super
    @name = Faker::Name.name
  end

  def fire!(other_board)
    square = other_board.all_squares.select { |square| square.status == :empty }.sample
    other_board.fire_at!(square)
  end
end

class Ship
  attr_accessor :squares
  attr_reader :direction, :size

  def initialize
    @name = self.class.to_s
    @squares = []
    @direction = [:horizontal, :vertical].sample
  end

  def status
    if @squares.all? { |square| square.status == :hit }
      'Sunk'
    else
      'Alive'
    end
  end
end

class Destroyer < Ship
  def initialize
    super
    @size = 1
  end
end

class Cruiser < Ship
  def initialize
    super
    @size = 2
  end
end

class Battleship < Ship
  def initialize
    super
    @size = 3
  end
end

class Game
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    @human.get_name
    print_welcome_message
    until game_over?
      display_boards
      @human.fire!(@computer.board)
      @computer.fire!(@human.board)
      system 'clear'
    end
    display_winner
  end

  private

  def print_welcome_message
    puts "Welcome, #{@human.name}. Prepare to battle."
  end

  def display_boards
    puts "#{@human.name}'s Board"
    @human.board.display
    puts ''
    puts "#{@computer.name}'s Board"
    @computer.board.display
  end

  def display_winner
    display_boards
    puts "#{winner.name} wins!"
  end

  def winner
    return @human if @computer.board.lost?
    return @computer if @human.board.lost?
  end

  def game_over?
    @human.board.lost? || @computer.board.lost?
  end
end

Game.new.play
