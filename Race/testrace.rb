require_relative 'RaceCar'
require_relative 'RaceTrack'

Blue = RaceCar.new("Blue")
Red = RaceCar.new("Red")
Yellow = RaceCar.new("Yellow")
Black = RaceCar.new("Black")

Lap = RaceTrack.new
Lap.add_car(Blue)
Lap.add_car(Red)
Lap.add_car(Yellow)

Lap.start_race
Lap.check
Lap.advance
Lap.check
Lap.advance
Lap.advance
Lap.add_car("Black")
Lap.advance
Lap.advance
Lap.check
Lap.advance
Lap.check