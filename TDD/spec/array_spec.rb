require 'array'
require 'rspec'

RSpec.describe Array do
  subject(:array) {Array.new([1, 2, 1, 3, 3])}
  
  describe "#remove_dups" do
    it "returns an array of unique elements in the order the first appear" do
      expect(array.remove_dups).to eq([1,2,3])
    end 
    
    it "does not call Array#uniq" do
      expect(array).to_not receive(:uniq)
      array.remove_dups
    end
    
    it "should not modify the orginal array" do
      expect(array).to eq([1,2,1,3,3])
      array.remove_dups
    end
  end
  
  let(:array1) {Array.new ( [-1, 0, 2, -2, 1] ) }
  describe "#two_sum" do
    it "returns an array of array of pairs" do
      result = array1.two_sum
      a = result.all? {|pair| pair.length == 2}
      expect(a).to be(true)
    end
    
    it "returns the correct pairs" do
      expect(array1.two_sum).to eq([[0, 4], [2, 3]])
    end
    
    it "puts the smaller index before the bigger index" do
      result = array1.two_sum
      a = result.all? {|pair| pair[0] < pair[1]}
      expect(a).to be(true)
    end
    
    it "sorts the arrays dictionary-wise" do
      expect(array1.two_sum).to eq(array1.two_sum.sort)
    end
  end
    
  let(:trans_array) {Array.new([
    [0, 1, 2, 5],
    [3, 4, 5, 3],
    [6, 7, 8, 2]])}
  describe "#my_tranpose" do
    it "ensures that all elements are nested arrays" do
      result = trans_array.my_tranpose
      a = result.all? {|el| el.is_a?(Array)}
      expect(a).to be(true)
    end
    
    it "correctly transposes non square arrays" do
      expect(trans_array.my_tranpose).to eq([[0, 3, 6],
                                            [1, 4, 7],
                                            [2, 5, 8],
                                            [5, 3, 2]]) 
    end
    
    it "correctly transposes rows to columns" do
      expect(trans_array.my_tranpose).to eq([[0, 3, 6],
                                             [1, 4, 7],
                                             [2, 5, 8],
                                             [5, 3, 2]]) 
    end
    
    it "does not call Array#tranpose" do
      expect(trans_array).not_to receive(:transpose)
      trans_array.my_tranpose
    end
  end
  
  
    
  
  
  
  
end