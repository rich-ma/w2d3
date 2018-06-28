require 'deck'
require 'rspec'


RSpec.describe Deck do
  subject(:deck) {Deck.new}
  
  describe "#initialize" do
    
    it "initializes with a unique deck" do
      expect(deck.pile).to eq(deck.pile.uniq)
    end
    
    it "intializes with 52 cards" do
      expect(deck.pile.length).to eq(52)
    end
    
    
  end
  
  
  
  
  
  
  
end