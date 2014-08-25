array = (1..100).to_a

sumsq = array.inject{|sum,x| sum + x**2 }

sqsum = (array.inject{|sum,x| sum + x })**2

puts sqsum - sumsq