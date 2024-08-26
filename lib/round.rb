class Round
    attr_accessor :deck, :cards, :card, :turn, 
                :current_card, :turn

    def initialize(deck)
        @deck = deck
        @turns = []
        @cards = cards
        @card = card
        @turn = turn
        @current_card = @deck.cards.first
    end

    def turns
        []
    end

    def new_turn = take_turn

    def take_turn(guess)
        turn = Turn.new(guess, @current_card)
        @turns << turn
        # require 'pry'; binding.pry
        # move_to_next_card
       return turn
       turns << turn
       
    end

    


    # def move_to_next_card
    #     current_index = @deck.cards.index(@current_card)
    #     if current_index += 1 < @deck.cards.length
    #     @current_card = @deck.cards[current_index + 1] 
    #     end
    # end 
        
end