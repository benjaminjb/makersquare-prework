class ConvertibleCar < Car

	def initialize(color)
		super(color)
		@roof = "up"
	end

	def roof_status
		puts "The roof is #{@roof}."
	end

	def top_down
		if @convertible
			@roof = "down"
		end
	end

	def close_top
		if @convertible
			@roof = "up"
		end
	end
end

convertible = new ConvertibleCar("orchid")
car_g.roof_status
car_g.top_down
car_g.roof_status
car_g.close_top
car_g.roof_status