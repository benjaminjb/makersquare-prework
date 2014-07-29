class RaceTrack
	attr_accessor :racers
	
	def initialize
		@racers = []
		@started = false
		@hours = 0
	end

	def add_car(car)
		if @started
			puts "Sorry, the race has started, so no new cars can be added."
		else
			@racers << car
		end
	end

	def start_race
		@racers.each {|x| x.speed = rand(20)+60}
		@started = true
	end

	def advance
		if @hours < 5
			@hours += 1
			@racers.each do |x|
				x.distance = x.distance + x.speed
				x.speed = x.speed + rand(20)
				@racers.sort! {|x,y| y.distance <=> x.distance }
			end
		else
			puts "The race is over!"
			puts "The results are"
			@racers.each { |x| puts (@racers.index(x) + 1).to_s + ") " + x.name.capitalize + " at " + x.distance.to_s + " distance." }
			@racers.each do |x| 
				x.speed = 0
				x.distance = 0
			end
			@started = false
		end
	end

	def check
		puts "At #{@hours}, the results are"
		@racers.each { |x| puts x.name.capitalize + " is at " + x.distance.to_s + " distance and travelling at " + x.speed.to_s + " mph" }
	end
end