class RaceCar
	attr_accessor :name
	attr_accessor :speed
	attr_accessor :distance

	def initialize(name)
		@name = name
		@speed = 0
		@distance = 0
	end

end
#could add car color, driver, sponsor, number