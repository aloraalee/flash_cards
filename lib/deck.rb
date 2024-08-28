class Deck
    attr_reader :cards
    #  attr_accessor :card

    def initialize(cards)
        @cards = cards
    end
    
    def count
        cards.length
    end

    def cards_in_category(category_type)
        @cards.select do |card|
    
            card.category == category_type

        end

    end
end