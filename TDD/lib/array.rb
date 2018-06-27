

class Array
  
  def remove_dups
    result = []
    self.each do |el|
      unless result.include?(el)
        result << el
      end
    end
    result
  end
  
  def two_sum
    result = []
    self.each_index do |i|
      j = i + 1
      while j < self.length
        result << [i, j] if (self[i] + self[j] == 0)
        j += 1
      end
    end
    result 
  end
  
  def my_tranpose
    result = Array.new(self[0].length) {Array.new()}
    self.each_index do |row| # 1 
      self[row].each_index do |col| #0 
        result[col] << self[row][col]
      end      
    end
    result
  end
    
end
  
  