# Create some Cards
# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Create some cards
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What country has the highest life expectancy?", "Hong Kong", :Health)

#Create a card
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

#Create a turn
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)

# Put those cards into a Deck
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new (cards)

# Create a new Round using the Deck you created
round = Round.new(deck)

def start(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-------------------------------------------------"
  puts "This is card number #{round.turns.count + 1} out of #{round.deck.count}"
  puts "Question: #{round.current_card.question}"
  turn = round.take_turn(gets.chomp)
  puts turn.feedback

  puts "This is card number #{round.turns.count + 1} out of #{round.deck.count}"
  puts "Question: #{round.current_card.question}"
  turn = round.take_turn(gets.chomp)
  puts turn.feedback

  puts "This is card number #{round.turns.count + 1} out of #{round.deck.count}"
  puts "Question: #{round.current_card.question}"
  turn = round.take_turn(gets.chomp)
  puts turn.feedback

  puts "This is card number #{round.turns.count + 1} out of #{round.deck.count}"
  puts "Question: #{round.current_card.question}"
  turn = round.take_turn(gets.chomp)
  puts turn.feedback

end

# Start the game
start(round)

# End the game
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of 4, for a total score of #{round.percent_correct}%."
puts "#{card.category} - #{round.percent_correct_by_category(:Geography)} % #{turn.feedback}"
puts "#{card.category} - #{round.percent_correct_by_category(:STEM)} % #{turn.feedback}"
puts "#{card.category} - #{round.percent_correct_by_category(:Health)} % #{turn.feedback}"

