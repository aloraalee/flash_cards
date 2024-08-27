require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new (cards)
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end

    it 'starts off with empty turns' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new (cards)
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it 'identifies a card' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new (cards)
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)
    end

    it 'records the card in the round' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn).to be_a(Turn)
        expect(new_turn.guess).to eq("Juneau")
        expect(new_turn.card).to eq(card_1)
        #expect(round.take_turn("Juneau")).to eq(@current_card, guess)
    end

    it 'moves to the next card after taking a turn' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.current_card).to eq(card_2)        
    end  

    it 'Recalls the class' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.class).to eq(Turn)
    end

    it 'Counts turns' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn("Juneau")
        expect(round.turns.count).to eq(1)
        
        round.take_turn("Mars")
        expect(round.turns.count).to eq(2)
    end 

    it 'Gives feedback for correct or incorrect cards' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn("Juneau")
        round.take_turn("Denver")

        expect(round.turns.last.feedback). to eq("Incorrect.")
    end

    it 'Counts correct cards' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.correct?).to eq(true)
        expect(round.number_correct).to eq(1)
    end  
    
    it 'Counts correct cards by category' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.number_correct_by_category(:Geography)).to eq(1) 
        expect(round.number_correct_by_category(:STEM)).to eq(0)
    end 

    it 'Calculates the percent correct' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
    
        round.take_turn("Juneau")
        round.take_turn("Denver")

        expect(round.percent_correct).to eq(50.0)
    end

   it 'Calculates the percent correct by category' do
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
    
        round.take_turn("Juneau")

        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    end

end