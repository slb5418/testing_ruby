require "tictactoe"

describe TicTacToe do

	let(:ttt) {ttt=TicTacToe.new()}
	
	context "when initialized" do
		it "will create the board and players" do

			expect(ttt.board).to be_an_instance_of(Board)
			expect(ttt.player1).to be_an_instance_of(Player)
			expect(ttt.player2).to be_an_instance_of(Player)
		end
	end
end