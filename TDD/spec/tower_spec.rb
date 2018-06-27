require 'tower'
require 'rspec'

RSpec.describe Tower do
  subject(:tower) {Tower.new}
  
    describe "#initialize" do
      it "initializes with 3 nested arrays, with the first having 3 rings" do
        expect(tower.towers).to eq([[3,2,1], [], []])
      end
    end
    
    describe "#move" do
      it "allows the player to move a ring to a tower with no ring" do
        tower.move(0,1)
        expect(tower.towers).to eq([[3,2], [1], []])
      end
      
      it "allows the player to move a ring to a tower with a larger ring" do
        tower.move(0,1)
        tower.move(0,2)
        tower.move(1,2)
        expect(tower.towers).to eq([[3], [], [2,1]])
      end
      
      it "shouldn't allow a ring to move to a tower with a smaller ring" do
        tower.move(0,1)
        expect{tower.move(0,1)}.to raise_error
      end
      
      it "shouldn't allow a move from an empty ring" do
        expect{tower.move(1,2)}.to raise_error
      end
    end
    
    describe "#prompt" do
      it "only allows selections within a valid range(0-2)" do
        allow(tower).to receive(:gets).and_return("2,3")
        expect{tower.prompt}.to raise_error
      end
      
      it "allows valid inputs" do
        allow(tower).to receive(:gets).and_return("0,1")
        expect(tower.prompt).to eq([0,1])
      end
    end
    
    let(:test_tower) {Tower.new([[],[3,2,1],[]])}
    let(:test_tower2) {Tower.new([[],[3,2],[1]])}
    
    describe "#won?" do
      it "wins when tower 1 or 2 has all 3 rings in descending order" do
        expect(test_tower.won?).to be true
      end
      
      it "does not throw a false positive" do
        expect(test_tower2.won?).to be false
      end
      
      it "does not win if the first tower has all the rings" do
        expect(tower.won?).to be false
      end
    end


    
    
end
