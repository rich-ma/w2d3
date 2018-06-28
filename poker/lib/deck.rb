require_relative 'card'

class Deck
  attr_reader :pile
 
 def initialize
   @pile = []
   populate
 end
 
 def deal_card
   pile.pop
 end
 
 def populate
   pile = []
   Card.get_suits.each do |suit|
      Card.get_values.each do |value|
        @pile << Card.new(suit, value)
      end
    end
    @pile.shuffle!
  end
    
  def inspect
    
  end
  
end