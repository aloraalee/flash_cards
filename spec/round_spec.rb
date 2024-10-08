require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new (@cards)
        @round = Round.new(@deck)
        end

    it 'exists' do

        expect(@round).to be_instance_of(Round)
    end

    it 'starts off with empty turns' do

        expect(@round.turns).to eq([])
    end

    it 'identifies a card' do

        expect(@round.current_card).to eq(@card_1)
    end

    it 'records the card in the round' do

        new_turn = @round.take_turn("Juneau")

        expect(new_turn).to be_a(Turn)
        expect(new_turn.guess).to eq("Juneau")
        expect(new_turn.card).to eq(@card_1)
    end

    it 'moves to the next card after taking a turn' do

        new_turn = @round.take_turn("Juneau")

        expect(@round.current_card).to eq(@card_2)        
    end  

    it 'Recalls the class' do

        new_turn = @round.take_turn("Juneau")

        expect(new_turn.class).to eq(Turn)
    end

    it 'Counts turns' do

        @round.take_turn("Juneau")
        expect(@round.turns.count).to eq(1)
        
        @round.take_turn("Mars")
        expect(@round.turns.count).to eq(2)
    end 

    it 'Gives feedback for correct or incorrect cards' do

        @round.take_turn("Juneau")
        @round.take_turn("Denver")

        expect(@round.turns.last.feedback). to eq("Incorrect.")
    end

    it 'Counts correct cards' do

        new_turn = @round.take_turn("Juneau")

        expect(new_turn.correct?).to eq(true)
        expect(@round.number_correct).to eq(1)
    end  
    
    it 'Counts correct cards by category' do

        new_turn = @round.take_turn("Juneau")

        expect(@round.number_correct_by_category(:Geography)).to eq(1) 
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end 

    it 'Calculates the percent correct' do
    
        @round.take_turn("Juneau")
        @round.take_turn("Denver")

        expect(@round.percent_correct).to eq(50.0)
    end

   it 'Calculates the percent correct by category' do
    
        @round.take_turn("Juneau")
        @round.take_turn("Mars")

        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
        expect(@round.percent_correct_by_category(:STEM)).to eq(100.0)
    end

end