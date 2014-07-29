class Car
	@@total_car_count = 0
	@@cars_per_color = {}
	
	def self.total_car_count
        @@total_car_count
    end

    def self.most_popular_color
		@@cars_per_color.max_by {|k,v| v}.shift.to_s
	end


	def initialize(color="blue")
		@distance = 0
		@fuel = 10
		@color = color

		if @@cars_per_color.has_key? color
			@@cars_per_color[color] += 1
		else
			@@cars_per_color[color] = 1
		end
		@@total_car_count += 1 
	end

	def color=(color)
		ex_color = @color
		@color = color
		if @@cars_per_color.has_key? color
			@@cars_per_color[color] += 1
		else
			@@cars_per_color[color] = 1
		end
		@@cars_per_color[ex_color] -= 1
	end

	def to_s
		"I'm a car! I've driven #{@distance} miles and have #{@fuel} gallons gas left."
	end
	
	def drive(miles)
		tank = @fuel - miles/20
		if tank >= 0
			@distance += miles
			@fuel = tank
		else
			@distance += 20 * @fuel
			@fuel = 0
			puts "You've run out of gas after driving #{@distance} miles."
		end
	end

	def fuel_up
		tank = 10 - @fuel
		cost = tank * 3.5
		@fuel = 10
		puts "You put in #{tank} gallons."
		puts "At $3.50 / gallon, that's $#{cost}."
	end

end

class ConvertibleCar < Car

	def initialize(color)
		super(color)
		@roof = "up"
	end

	def roof_status
		puts "The roof is #{@roof}."
	end

	def top_down
		@roof = "down"
	end

	def close_top
		@roof = "up"
	end
end

car_a = Car.new()
car_b = Car.new()
car_c = Car.new("red")
car_d = Car.new("red")
car_e = Car.new("yellow")
car_f = Car.new("red")
car_f.color = "blue"
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b
puts Car.total_car_count
Car.new(Car.most_popular_color)
puts Car.most_popular_color

car_g = ConvertibleCar.new("orchid")
car_g.roof_status
car_g.top_down
car_g.roof_status
car_g.close_top
car_g.roof_status
