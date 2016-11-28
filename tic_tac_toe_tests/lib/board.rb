class Board

  attr_accessor :board

  def initialize()
	  @board = []
	  (1..9).each{|x| @board << x}
  end

  def changeLocation(location, marker)
      @board[location-1] = marker
  end

  def checkLocation(location)
    i = location-1
    if @board[i] != 'X' && @board[i] != 'O'
      return true
    else
      return false
    end
  end

  def show()
    puts "\n"
	  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	  puts ' ----------'
	  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	  puts ' ----------'
	  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	  puts "\n"
	end

  def checkWinner(marker)

    winner = false

    winning_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],
    					[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    winning_combos.each do |arr|
      if @board[arr[0]] == marker && @board[arr[1]] == marker && @board[arr[2]] == marker
        winner = marker
      end 
    end

    return winner
  end

  def checkFull()
    not_used = [1,2,3,4,5,6,7,8,9]
    @board.each do |marker|
      return false if not_used.include? marker
    end
    return true
  end

end