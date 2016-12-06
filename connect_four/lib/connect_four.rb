
class ConnectFour
	attr_accessor :board, :player
	def initialize
		@board = Array.new(6){Array.new(7)}
		@player = "red"
	end

	def move(location)
		x, y = location
		if board[x][y].nil?
			if x == 0
				board[x][y] = player
			elsif !board[x-1][y].nil?
				board[x][y] = player
			else
				return false 
			end
		else
			return false
		end
		return board
	end

	def switch_player
		if player == "red"
			self.player = "black"
		else 
			self.player = "red"
		end
	end

	def check_winner
		check_rows || check_cols || check_diagonals(board) || check_diagonals(board.reverse)
	end

	def check_rows
		board.each do |row|
			row.each_cons(4) do |cons|
				winner = check_identical(cons)
				return winner if winner
			end
		end
		return false
	end

	def check_cols
		board.transpose.each do |col|
			col.each_cons(4) do |cons|
				winner = check_identical(cons)
				return winner if winner
			end
		end
		return false
	end

	def check_diagonals(board)
		4.times do |k|
	        a, b, i, j = [], [], 0, 0
	        loop do
	            j = i + k
	            break if j > 6 || i > 5
	            a << board[i][j]
	            b << board[j][i] if j <= 5 && j != i
	            i += 1
	        end
	        a.each_cons(4) do |cons|
	        	winner = check_identical(cons)
	        	return winner if winner
	        end
	        b.each_cons(4) do |cons|
	        	winner = check_identical(cons)
	        	return winner if winner
	        end
	    end
	    return false
	end

	def check_identical(arr)
		if arr.uniq.length == 1 && !arr.first.nil?
			return arr.first
		else
			return false
		end
	end

    def format_row(arr)
        arr.map do |column|
            if column.nil?
                "  ⛚  "
            elsif column == 'red'
                " red "
            else
                "black"
            end
        end * ' '
    end

    def format_board
        board.map do |row|
            format_row(row)
        end.join("\n") + "\n"
    end
end

class Driver
	def initialize
		self.run()
	end

	def run
		cf = ConnectFour.new()
		puts "Welcome to Connect Four!"
		puts "Player 1 is red and Player 2 is black"
		puts cf.format_board
		winner = false
		while !winner
			puts "#{cf.player} player, where would you like to move?"
			
			valid_move = false
			while !valid_move
				loc = gets.chomp
				valid_move = cf.move(loc.split(',').map(&:to_i))
			end
			puts cf.format_board
			winner = cf.check_winner
			cf.switch_player
		end
		puts "The winner is :#{winner}"
	end
end


if __FILE__ == $0
  Driver.new()
end