(1..100).each do |testnum|
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