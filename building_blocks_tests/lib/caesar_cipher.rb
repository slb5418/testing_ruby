def caesar_cipher(string, shift)

	alphabet = ('a'..'z').to_a
	cipher = ''

	string.each_char do |char|
		# check if special char
		if !alphabet.include? char.downcase
			cipher << char
			next
		end

		# check if capital
		is_upper = true if char == char.upcase

		# find the index and add shift
		i = alphabet.index(char.downcase).to_i + shift

		# if over 26 take modulus
		i = i % 26 if i >= 26
 
		if is_upper
			cipher << alphabet[i].upcase 
		else 
			cipher << alphabet[i]
		end
	end
	return cipher
end

puts caesar_cipher("What a string!", 5)
puts caesar_cipher("xyz", 3)
