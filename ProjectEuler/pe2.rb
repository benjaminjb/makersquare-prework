fibseq = [1,2]
while fibseq[-2] + fibseq[-1] < 4000000
	fibseq << fibseq[-2] + fibseq[-1]
end
sum = 0
fibseq.each do |x|
	if x % 2 == 0
		sum += x
	end
end
# a.each { |x| sum+= x if x.even? }
puts sum