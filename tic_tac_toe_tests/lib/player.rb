class Player
  
  def initialize(marker)
    @marker = marker
  end

  def marker()
    @marker
  end

  def play()
	  puts "Player #{@marker}, where would you like to move? (1-9)"
	  location = gets.chomp()
	  return location.to_i if (1..9).include? location.to_i
    self.play()
  end
  
end