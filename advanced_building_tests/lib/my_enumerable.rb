
module Enumerable

	def my_each
		if block_given?
			for i in self
				yield(i)
			end
		end
		return self.to_enum
	end

	def my_each_with_index
		if block_given?
			for i in self
				yield(i,self.index(i))
			end
		end
		return self.to_enum
	end

	def my_select
		if block_given?
			arr = []
			for i in self
				arr << i if yield(i)
			end
			return arr
		end
		return self.to_enum()
	end

	def my_all?
		if block_given?
			self.my_each { |x| return false if not yield(x) }
			return true
		end
		self.my_each { |x| return false if not x }
		return true
	end

	def my_any?
		if block_given?
			 self.my_each { |x| return true if yield(x) }
			 return false
		end

		self.my_each { |x| return true if x}
		return false
	end

	def my_none?
		if block_given?
			self.my_each {|x| return false if yield(x)}
			return true
		end
		self.my_each {|x| return false if x}
		return true
	end 

	def my_count (item=nil)
		count = 0
		if block_given?
			self.my_each {|x| count += 1 if yield(x)}
		end

		if not item == nil
			self.my_each {|x| count += 1 if x == item}
		end

		self.my_each {count +=1}
	end

	def my_map (proc=nil)
		arr = []

		if not proc.nil?
			self.my_each { |i| arr.push(proc.call(i)) }
			return arr
		end

		if block_given?
			self.my_each { |x| arr.push( yield(x)) }
			return arr
		end

		return arr.to_enum # if no proc or block given
	end

	def my_inject (initial=nil)
		result = initial.nil? ? self.first() : initial
		if block_given?
			self.my_each {|n| result = yield(result,n)}
		end
		result
	end

	def multiply_els (init=1)
		result = self.my_inject(init) {|product, obj| product*obj}
	end

end



list = [1,2,3,4,5,6]

puts 'my_each:'
list.my_each {|x| puts x+5}
puts list.my_each

puts 'my_each_with_index:'
list.my_each_with_index do |x,y|
	puts x, y
end
enum2 = list.my_each_with_index
enum2.next()
enum2.next()

select_arr = list.my_select { |x| x % 2 == 0 }
puts 'select array:'
puts select_arr

select_arr = list.my_select
puts 'select array:'
puts select_arr
puts select_arr.next()
puts select_arr.next()
puts select_arr.next()

puts 'my_all?'
puts list.my_all? { |x| x % 2 == 0 }
puts list.my_all?

puts 'my_any?'
puts list.my_any? { |x| x % 2 == 0 }
puts list.my_any?

puts 'my_none?'
puts [1,3,5,7].my_none? { |x| x % 2 == 0 }
puts list.my_none?

puts 'my_count'
puts list.count()
puts [2,3,4,2,5,3,2].count(2)
puts list.count {|x| x % 2 == 0}

puts 'my_map'
puts list.my_map{ |x| x*x }
puts list.my_map

puts 'my_inject'
puts list.multiply_els
puts list.my_inject {|sum,n| sum+n}

puts 'my_map_proc'
puts list.my_map (Proc.new {|x| x*x})