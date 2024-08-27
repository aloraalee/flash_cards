class Round
    attr_accessor :deck, :cards, :card, :turn, 
                :current_card, :category, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = @deck.cards.first
        @correct_count = 0
    end

    def take_turn(guess)
        turn = Turn.new(guess, @current_card)
        @turns << turn
            if turn.correct? == true
                @correct_count += 1
            end
        move_to_next_card
        turn
       
    end

    def move_to_next_card
        current_index = @deck.cards.index(@current_card)
        if current_index + 1 < @deck.cards.length
        @current_card = @deck.cards[current_index + 1] 
        end
    end 
    
    def number_correct
        @correct_count
    end

    def number_correct_by_category(category)
        @turns.count { |turn| turn.correct? && turn.card.category == category }
    end

    def percent_correct 
        (number_correct.to_f / turns.count) * 100
    end

    def percent_correct_by_category(category)
        total_turns_in_category = @turns.count { |turn| turn.card.category == category }
        (number_correct_by_category(category).to_f / turns.count) * 100
    end    

end