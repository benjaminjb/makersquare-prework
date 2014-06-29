class Player
	
	def set_up
		puts "What's your name?"
		name = gets.downcase.chomp.capitalize
		@name = name

		puts "What's your main quality? Are you: "
		puts "Smart?"
		puts "Bored?"
		puts "Depressed?"
		attrib = gets.downcase.chomp
		
		case attrib
		when "smart"
			puts "#{name} is smart."
			@wits = 3
			@sanity = 3
		when "bored"
			puts "#{name} is bored."
			@wits = 3
			@sanity = 3
		when "depressed"
			puts "#{name} is depressed."
			@wits = 3
			@sanity = 3
		else
			puts "#{name} is incapable of following directions."
			@wits = 3
			@sanity = 3
		end
	
		puts "What's your age?"
		gets.chomp
		puts "Not that that matters to the Great Old Ones, whose age is reckoned in the lives of stars and deathless aeons."
	end

	def check_sanity
		puts "Your sanity is #{@sanity}."
		puts "You've been saner."
	end

	def lower_sanity(num)
		@sanity = @sanity - num
	end
end
