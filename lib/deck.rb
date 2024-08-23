class Deck
    attr_reader :cards
    
    def initialize(cards)
        @cards = cards
    
    end
    
    def cards
        []
    end
end

#require 'pry'; binding.pry