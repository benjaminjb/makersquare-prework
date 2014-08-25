primes = []
i = 2
# number = 600851475143
number = 50
until i > number do 
	if number % i == 0
		primes << i
		number = number / i
		i = 2
	end
	i += 1
end
primes.each {|x| puts x}