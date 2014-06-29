=begin exercise 34
numbers = []
(1..100).each { |x| numbers << x}

numbers.each do |testnum|
	if (testnum % 3 == 0 && testnum % 5 == 0)
		puts "FizzBuzz"
	elsif (testnum % 3 == 0)
		puts "Fizz"
	elsif (testnum % 5 == 0)
		puts "Buzz"
	else
		puts testnum
	end
end
=end

			