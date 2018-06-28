class Hand  
  attr_reader :cards
  
  def initialize
    @cards = []
  end
  
  def add_card(card)
    cards << card
  end
  
  private
  attr_writer :cards
  


end