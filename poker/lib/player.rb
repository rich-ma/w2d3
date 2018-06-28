require_relative 'hand'

class Player
  attr_reader :hand, :stack, :name
  
  def initialize(name)
    @name = name
    @hand = Hand.new
    @stack = 1000
  end
  
  def add_to_hand(card)
    hand.add_card(card)
  end
  
  def show_hand
    hand.cards
  end
  
  private

  attr_writer :stack
  
end