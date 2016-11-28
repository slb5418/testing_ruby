require "board"

describe Board do

	let(:board) {Board.new()}

	context "when initialized" do
		it "creates a board array 1 to 9" do
			expect(board.board).to eql((1..9).to_a)
		end
	end

	describe "#changeLocation" do
		context "given a location and X" do
			it "changes the board location to X" do
				board.changeLocation(1,"X")
				expect(board.board[0]).to eql("X")
			end
		end

		context "given a location and O" do
			it "changes the board location to O" do
				board.changeLocation(2,"O")
				expect(board.board[1]).to eql("O")
			end
		end
	end

	describe "#checkLocation" do
		context "given a location of X" do
			it "returns false" do
				board.changeLocation(1,"X")
				expect(board.checkLocation(1)).to be false
			end
		end

		context "given a location of O" do
			it "returns false" do
				board.changeLocation(5,"O")
				expect(board.checkLocation(5)).to be false
			end
		end

		context "given a location not used" do
			it "returns true" do
				(1..9).each do |n|
					expect(board.checkLocation(n)).to be true
				end
			end
		end
	end

	describe "#show" do
		context "3 X's on top" do
			it "returns a board with 3 X's on top" do
				(1..3).each{|i| board.changeLocation(i,'X')}
				expect {board.show()}.to output("\n X | X | X "\
												"\n ----------"\
												"\n 4 | 5 | 6 "\
												"\n ----------"\
												"\n 7 | 8 | 9 "\
												"\n\n").to_stdout
			end
		end

		context "3 O's in middle" do
			it "returns a board with 3 O's in the middle" do
				(4..6).each{|i| board.changeLocation(i,'O')}
				expect {board.show()}.to output("\n 1 | 2 | 3 "\
												"\n ----------"\
												"\n O | O | O "\
												"\n ----------"\
												"\n 7 | 8 | 9 "\
												"\n\n").to_stdout
			end
		end
	end

	describe "#checkWinner" do
		context "3 X's on top" do
			it "returns X as winner" do
				(1..3).each{|i| board.changeLocation(i,'X')}
				expect(board.checkWinner("X")).to eql("X")
			end
		end
		context "3 O's in middle" do
			it "returns O as winner" do
				(4..6).each{|i| board.changeLocation(i,'O')}
				expect(board.checkWinner("O")).to eql("O")
			end
		end
	end

	describe "#checkFull" do
		context "full board" do
			it "returns true" do
				(1..9).each{|i| board.changeLocation(i,'X')}
				expect(board.checkFull()).to be true
			end
		end

		context "not full board" do
			it "returns false" do
				(1..3).each{|i| board.changeLocation(i,'X')}
				expect(board.checkFull()).to be false
			end
		end
	end
end
