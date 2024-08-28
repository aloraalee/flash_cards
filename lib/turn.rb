class Turn
    attr_reader :guess,
                :card,
                :feedback

    def initialize(guess, card)
        @guess = guess.capitalize
        @card = card
    end

    def correct?
        if @guess == card.answer
            return true
        else
            false
        end
    end

    def feedback 
        if @guess == card.answer
            "Correct!"
        else 
            "Incorrect."
        end
    end
end
