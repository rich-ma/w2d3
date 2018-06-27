class Tower  
  attr_accessor :towers
  
  def initialize(tower = [[3,2,1],[],[]])
    @towers = tower
  end
  
  def move(start_tower, end_tower)
    if valid_move?(start_tower, end_tower)
      ring = towers[start_tower].pop
      towers[end_tower].push(ring)
    else
      raise "YOU DONE FCCKED UP"
    end  
  end
  
  def game
    until won?
      p towers
      input = prompt
      move(input[0], input[1])
      p towers
    end
    puts "YOU WIN!! kbye" 
  end
  
  def prompt
    puts "Choose your starting tower and ending tower. ex. 1,2"
    input = gets.chomp.split(",").map! {|el| el.to_i}
    if valid_input?(input)
      return input 
    else
      raise "Invalid range"
    end
  end
  
  def won?
    return true if towers[1].length == 3 || towers[2].length == 3
    false
  end
  
  
  
  private
  
  def valid_input?(positions)
    return false if positions.any?{|el| el < 0 || el > 2}
    true
  end
  
  def valid_move?(start_tower, end_tower)
    return true if towers[start_tower].last && towers[end_tower].empty?
    return false if towers[start_tower].last > towers[end_tower].last
    return false if towers[start_tower].empty?
    true
  end
end

if $PROGRAM_NAME == __FILE__
  tower = Tower.new
  tower.game
  
end
