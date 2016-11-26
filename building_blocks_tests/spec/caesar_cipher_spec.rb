require "caesar_cipher"

describe "#caesar_cipher" do

	context "given 'abc', 1" do
		it "returns 'bcd'" do
			expect(caesar_cipher("abc", 1)).to eql("bcd")
		end
	end

	context "given 'ABC', 1" do
		it "returns 'BCD'" do
			expect(caesar_cipher("ABC", 1)).to eql("BCD")
		end
	end	

	context "given 'xyz', 3" do
		it "returns abc" do
			expect(caesar_cipher("xyz", 3)).to eql("abc")
		end
	end

	context "given 'XYZ', 3" do
		it "returns 'ABC'" do
			expect(caesar_cipher("XYZ", 3)).to eql("ABC")
		end
	end

	context "given 'shift TEST', 5" do
		it "returns xmoka YJXY" do
			expect(caesar_cipher("shift TEST", 5)).to eql("xmnky YJXY")
		end
	end

	context "given '!@#$%^&*()" do
		it "returns '!@#$%^&*()'" do
			expect(caesar_cipher("!@#$%^&*()", 5)).to eql("!@#$%^&*()")
		end
	end
end