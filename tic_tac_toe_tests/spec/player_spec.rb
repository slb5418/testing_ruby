require "player"

describe Player do

	let(:player1) {Player.new("X")}
	let(:player2) {Player.new("O")}

	context "when initialized with X" do 
		it "sets the marker to X" do
			expect(player1.marker).to eql("X")
		end
	end

	context "when initialized with O" do
		it "sets marker to O" do
			expect(player2.marker).to eql("O")
		end
	end

	describe "#play" do
		context "when provided 1" do
			it "returns 1" do
				$stdin = StringIO.new("1")
				location = player1.play()
				expect(location).to eql(1)
			end
		end

		context "when provided 9" do
			it "returns 9" do
				$stdin = StringIO.new("9")
				location = player1.play()
				expect(location).to eql(9)
			end
		end

		context "when provided 10" do
			it "will prompt the user again" do
				$stdin = StringIO.new("10\n5")
				location = player1.play()
				expect(location).to eql(5)
			end
		end
	end
end