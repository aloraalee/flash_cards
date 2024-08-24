class Deck
    attr_reader :cards
     attr_accessor :card

    def initialize(cards)
        @cards = cards
    end
    
    def count
        cards.length
    end

    def cards_in_category(category_type)
        @cards.find_all do |card|
            # @card = card
            category_type = []
            card.category == category_type
            category_type << card

        end

    end
end

#require 'pry'; binding.pry