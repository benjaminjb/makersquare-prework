sum = 0
number_array = (1..999).to_a
number_array.each do |number|
	if (number % 3 == 0 || number % 5 == 0)
		sum += number
	end
end
puts sum

# y = 0
# (1..999).each { |x| y = y + x if (x % 3 == 0) || (x % 5 == 0) }
# puts y