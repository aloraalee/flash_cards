require './lib/deck'
require './lib/card'

RSpec.describe Deck do
    xit 'exists' do
        deck = Deck.new (cards)
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        expect(deck).to be_instance_of(Deck)
    end

    xit 'has cards' do
        deck = Deck.new (cards)
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        expect(deck.cards).to eq([card_1, card_2, card_3])
    end

   xit 'can count cards in deck' do
        deck = Deck.new (cards)
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        expect(deck.count).to eq(3)
   end

   xit 'it is STEM by default' do
        deck = Deck.new (cards)
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        expect(deck.cards_in_category).to eq(:STEM)

   end

   xit 'does not have to be STEM' do
        deck = Deck.new (cards)
        card_1 = Card.new("What is the capital of Alaska", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        expect(deck.cards_in_category).to eq(:Geography)

    end

end