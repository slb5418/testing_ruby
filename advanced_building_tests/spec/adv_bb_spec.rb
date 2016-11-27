require "my_enumerable"

describe Enumerable do
	
	!let(:list) {[1,2,3,4,5,6]}

	describe "#my_each" do

		context "given array without block" do
			it "returns Enumerator" do
				expect(list.my_each).to be_an_instance_of(Enumerator)
			end
		end

		context "given array with block" do 
			it "applies block to each element" do
				result = []
				list.my_each{|n| result << n+5}
				expect(result).to eql([6,7,8,9,10,11])
			end
		end
	end

	describe "#my_each_with_index" do

		context "given array without block" do
			it "returns Enumerator" do
				expect(list.my_each).to be_an_instance_of(Enumerator)
			end
		end

		context "given block appending elements" do
			it "returns elements" do
				items = []
				list.my_each_with_index{|n,i| items << n}
				expect(items).to eql([1,2,3,4,5,6])
			end
		end

		context "given a block that tracks index" do
			it "returns the indices" do
				indices = []
				list.my_each_with_index{|n,i| indices << i}
				expect(indices).to eql([0,1,2,3,4,5])
			end
		end
	end

	describe "#my_select" do

		context "given array without block" do
			it "returns Enumerator" do
				expect(list.my_select).to be_an_instance_of(Enumerator)
			end
		end

		context "given block that checks if even" do
			it "returns array of even numbers" do
				expect(list.my_select{ |n| n % 2 == 0}).to eql([2,4,6])
			end
		end
	end


end