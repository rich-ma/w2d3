
class Card
  SUITS = [:heart, :diamond, :clubs, :spades].freeze
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
  
  attr_reader :value, :suit
  
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
  
  def self.get_suits
    SUITS
  end

  def self.get_values
    VALUES
  end
  
  def inspect
    if suit == :heart
      [value + "♥️ "]
    elsif suit == :diamond
      [value + "♦️ "]
    elsif suit == :clubs
      [value + "♣️ "]
    else
      [value + "♠️ "]
    end        
  end    
end