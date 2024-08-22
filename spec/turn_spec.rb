require './lib/turn'

RSpec.describe Turn do
    it 'exists' do
        turn = Turn.new("Juneau", card)
    
        expect(turn).to be_instance_of(Turn)
    end

    xit 'has a guess' do
        turn = Turn.new("Juneau", card)
    
        expect(turn.guess).to eq("Juneau")
      end
end