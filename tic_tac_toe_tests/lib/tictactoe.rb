require_relative "player"
require_relative "board"

class TicTacToe

  attr_accessor :board, :player1, :player2

  def initialize

    # create the players
    @player1 = Player.new("X")
    @player2 = Player.new("O")

    # create the board
    @board = Board.new()

    # Start the game!
    # self.play()
  end

  def play()
    # Welcome message
    puts "\n"
    puts "Welcome to Tic Tac Toe!!!"
    puts "\nPlayer 1 is X's and Player 2 is O's."

  	winner = false
  	while not winner
  	  # player 1 moves
  	  @board.show()
      check = false
      while not check
  	    location = @player1.play()
        check = @board.checkLocation(location)
      end
  	  @board.changeLocation(location, @player1.marker)

  	  # did he win?
  	  winner = @board.checkWinner(@player1.marker)
  	  break if winner

      # is it full?
      full = @board.checkFull()
      break if full

  	  # player 2 plays
  	  @board.show()
      check = false
      while not check
  	    location = @player2.play()
        check = @board.checkLocation(location)
      end
  	  @board.changeLocation(location, @player2.marker)

  	  # did he win?
  	  winner = @board.checkWinner(@player2.marker)
      break if winner

      # is it full?
      full = @board.checkFull()
      break if full
	  end

    @board.show()
    if not full
      puts "Player #{winner} won the game!"
    else
      puts "No one wins!"
    end
  end
end


if __FILE__ == $0
  ttt = TicTacToe.new()
  ttt.play()
end


