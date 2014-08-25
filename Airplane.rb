class Airplane
	@@city_to_airplane_hash = {}
	@@flying_to = {}

	def initialize(city,capacity)
		# until @@city_to_airplane_hash[city] = nil # check hash
		# 	puts "There's already a plane at #{city}."
		# else
		@city = city
		@capacity = capacity
		@open_seats = capacity

		SETUP

		# (@@city_to_airplane_hash[city] ||= []) << self # check if self works here
		# end
	end

	def fly_to_city(city)
		# unless @@city_to_airplane_hash[city] = nil
		# 	puts "There's already a plane at #{city}."
		# else
		# @@city_to_airplane_hash[@city] = nil # or remove from hash
		REMOVE FROM ARRAY IN HASH
		@city = city
		SETUP
		end
	end

	def SETUP
		SEE IF CITY EXISTS IN THE HASH
		ELSE CREATE EMPTY ARRAY
		ADD AIRPLANE TO CITY ARRAY
	end

	# def can_i_fly(city1,city2)
	# 	@@city_to_airplane_hash[city1] != nil && @@city_to_airplane_hash[city2] == nil 
	# end

	def book_flight(city)
		if destination == city && @open_seats > 0
			@open_seats -= 1



end