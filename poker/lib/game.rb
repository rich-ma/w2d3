require_relative 'deck'
require_relative 'player'

class Game
  
  attr_reader :pot
  
  def initialize(player1, player2)
    @deck = Deck.new
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @pot = 0
  end
  
  def switch_player
    current_player = (current_player == player1 ? player2 : player1)
  end
  
  def add_to_pot(val)
    pot += val
  end
  
  def deal_to_players
    5.times do
      player1.add_to_hand(deck.deal_card)
      player2.add_to_hand(deck.deal_card)
    end
  end
  
  def game
    deal_to_players
    p player1.show_hand
    p player2.show_hand
  end
  
  private
  attr_accessor :deck, :player1, :player2  
end

if $PROGRAM_NAME == __FILE__
  a = Player.new("Blah")
  b = Player.new("Bleh")
  d = Game.new(a,b)
  d.game
end


