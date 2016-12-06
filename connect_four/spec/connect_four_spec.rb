require "connect_four"

describe ConnectFour do

	let(:cf) {ConnectFour.new()}

	describe "#initialize" do
		it "creates the players and board" do
			expect(cf.player).to eql("red")
			expect(cf.board).to eql(Array.new(6){Array.new(7)})
		end
	end

	describe "#move" do
		context "given a location" do
			it "changes board location to red" do
				cf.move([0,0])
				expect(cf.board[0][0]).to eql("red")
			end
		end

		context "given a location" do
			it "changes board location to black" do
				cf.switch_player
				cf.move([0,0])
				expect(cf.board[0][0]).to eql("black")
			end
		end

		context "given an already red location" do
			it "returns false" do
				cf.move([0,0])
				expect(cf.move([0,0])).to eql(false)
			end
		end

		context "given an already black location" do
			it "returns false" do
				cf.switch_player
				cf.move([0,0])
				expect(cf.move([0,0])).to eql(false)
			end
		end

		context "trying to move in the middle of empty board" do
			it "returns false" do
				expect(cf.move([1,1])).to eql(false)
			end
		end
	end

	describe "#switch_player" do
		context "when player is red, switch to black" do
			it "returns black" do
				cf.switch_player
				expect(cf.player).to eql("black")
			end
		end

		context "when player is black, switch to red" do
			it "returns red" do
				cf.switch_player
				cf.switch_player
				expect(cf.player).to eql("red")
			end
		end
	end

	describe "#check_winner" do
		context "four horizontal red on edge" do
			it "returns red" do
				(0..3).each{|i| cf.move([0,i])}
				expect(cf.check_winner).to eql(cf.player)
			end
		end

		context "four horizontal red in middle" do
			it "returns red" do
				cf.switch_player
				(2..3).each{|i| cf.move([0,i])}
				cf.switch_player
				(3..5).each{|i| cf.move([0,i])}
				(2..5).each{|i| cf.move([1,i])}
				expect(cf.check_winner).to eql(cf.player)
			end
		end

		context "four vertical red on edge" do
			it "returns red" do
				(0..3).each{|i| cf.move([i,0])}
				expect(cf.check_winner).to eql(cf.player)
			end
		end

		context "four vertical red in middle" do
			it "returns red" do
				(0..3).each{|i| cf.move([i,2])}
				expect(cf.check_winner).to eql(cf.player)
			end
		end

		context "four horizontal black on edge" do
			it "returns black" do
				cf.switch_player
				(0..3).each{|i| cf.move([0,i])}
				expect(cf.check_winner).to eql(cf.player)
			end
		end

		context "four horizontal black in middle" do
			it "returns black" do
				(2..3).each{|i| cf.move([0,i])}
				cf.switch_player
				(3..5).each{|i| cf.move([0,i])}
				(2..5).each{|i| cf.move([1,i])}
				expect(cf.check_winner).to eql(cf.player)
			end
		end

		context "four vertical black on edge" do
			it "returns black" do
				cf.switch_player
				(0..3).each{|i| cf.move([i,2])}
				expect(cf.check_winner).to eql(cf.player)
			end
		end

		context "four vertical black in middle" do
			it "returns black" do
				cf.switch_player
				(0..3).each{|i| cf.move([i,2])}
				expect(cf.check_winner).to eql(cf.player)
			end
		end

		context "four diagonal red" do
			it "returns red" do
				b = [
					["red",   "black", "red",   "red",   "red",   "black", "red"],
					["red",   "red",   "red",   "black", "red",   "black", "red"],
					["red",   "red",   "red",   "black", "red",   "black", "black"],
					["black", "red",   "black", "red",   "black", "red",   "red"],
					["red",   "black", "red",   "red",   "red",   "black", "red"],
					["red",   "black", "red",   "red",   "red",   "black", "red"]
					]
				cf.instance_variable_set("@board", b)
				expect(cf.check_winner).to eql(cf.player)
			end
		end
	end

end


