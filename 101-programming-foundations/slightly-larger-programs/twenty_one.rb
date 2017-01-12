require 'pry'

SUITS = %w(Clubs Diamonds Hearts Spades).freeze
CARDS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
CARD_VALUES = { "2" => 2, "3" => 3, "4" => 4, "5" => 5,
                "6" => 6, "7" => 7, "8" => 8, "9" => 9,
                "10" => 10, "Jack" => 10, "Queen" => 10,
                "King" => 10, "Ace" => 11 }.freeze

def prompt(msg, method="puts")
  puts "=> #{msg}" if method == "puts"
  print "=> #{msg}" if method == "print"
end

def initialize_deck
  CARDS.product(SUITS)
end

def deal_card!(player, deck)
  card = deck.delete(deck.sample)
  player << card
end

def initialize_game(player, dealer, deck)
  prompt "Welcome to 21!"
  2.times do
    deal_card!(player, deck)
    deal_card!(dealer, deck)
  end
  prompt "----------"
  prompt "The dealer is showing the #{dealer.first.join(' of ')}."
end

def card_join(card)
  card.join(" of ")
end

def display_hand(player)
  player.each { |card| prompt card_join(card) }
  prompt "Score: #{hand_value(player)}"
end

def hand_value(player)
  score = player.inject(0) { |sum, card| sum + CARD_VALUES[card.first] }
  if score > 21 && ace?(player)
    score -= 10
  end
  return score
end

def ace?(player)
  return false unless player.select { |card| card.first == "Ace" }
end

def bust?(player)
  hand_value(player) > 21
end

def blackjack?(player)
  hand_value(player) == 21
end

def winner(player, dealer)
  if hand_value(player) > hand_value(dealer) || bust?(dealer)
    return "player"
  elsif hand_value(player) < hand_value(dealer)
    return "dealer"
  else
    return "push"
  end
end

def display_score(player)
  prompt "Score: #{hand_value(player)}"
end

deck = initialize_deck
player = []
dealer = []

initialize_game(player, dealer, deck)

prompt "----------"

display_hand(player)

loop do
  prompt "Would you like to hit or stay? (h / s)"
  answer = gets.chomp
  break if answer.downcase.start_with?('s')
  deal_card!(player, deck)
  prompt "You pulled: #{card_join(player.last)}"
  display_score(player)
  break if bust?(player) || blackjack?(player)
end

if bust?(player)
  prompt "Bust! You lose. Thanks for playing!"
  exit
end

if blackjack?(player)
  prompt "Wow, 21! You win. Thanks for playing!"
  exit
end

prompt "----------"
prompt "Dealer's turn."
display_score(dealer)

loop do
  break if bust?(dealer) || blackjack?(dealer) || hand_value(dealer) > 16
  deal_card!(dealer, deck)
  prompt "Dealer pulled: #{card_join(dealer.last)}"
end

if winner(player, dealer) == "player"
  prompt "You win with #{hand_value(player)} vs #{hand_value(dealer)}."
elsif winner(player, dealer) == "dealer"
  prompt "Dealer wins with #{hand_value(dealer)} vs #{hand_value(player)}."
else
  prompt "It's a push. Thanks for playing."
end
