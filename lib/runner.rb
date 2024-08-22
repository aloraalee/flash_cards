require './card'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)

require 'pry'; binding.pry