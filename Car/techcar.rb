class Car
	attr_reader :color
	attr_reader :repaint_count

	def initialize(color)
		@color = color
		@repaint_count = 0
	end

	def paint(color)
		@color = color
		@repaint_count += 1
	end
end

c = Car.new("blue")
puts c.color # blue
puts c.repaint_count # 0
c.paint("red")
c.paint("green")
puts c.repaint_count # 2
puts c.color # green