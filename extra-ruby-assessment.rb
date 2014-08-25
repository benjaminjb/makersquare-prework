class Person
	attr_reader :name, :age
	def initialize(name, age)
		@name = name
		@age = age
	end
end

nick = Person.new("Nick", 25)
jim = Person.new("Jim", 37)
bob = Person.new("Bob", 23)
rob = Person.new("Rob", 29)
sue = Person.new("Sue", 31)

peeps = [nick, jim, bob, rob, sue]

# iterate over peeps array to create a hash that looks like this:
# people_ages = {
# 	"Nick" => 25,
# 	"Jim" => 37,
# 	"Bob" => 23,
	# etc...
# }

peoples_ages = {}
peeps.each {|person| peoples_ages[person.name] = person.age} 

# Is there a way to do this in one line?

peoples_ages = Hash[peeps.map {|person| [person.name, person.age]}]

# READABLE not CLEVER
############################################################################################################################
############################################################################################################################

win_lose = ["win", "lose", "win", "lose", "win", "win"]

# iterate over win_lose array to create a hash that looks like this:
# win_loss_count = {
# 	"win" => 4,
# 	"loss" => 2
# }

win_loss_count = Hash.new(0) # win_loss_count = {"win"=>0,"lose"=>0}
win_lose.each {|outcome| win_loss_count[outcome] += 1}

win_loss_count = Hash.new
win_lose.each do |outcome|

    if win_loss_count[outcome] 
        win_loss_count[outcome] +=1
    else
        win_loss_count[outcome] = 1
    end
    
end



############
# Exercise 1
############
 
class Person
	attr_reader :name, :city, :state, :zip, :hobby
	def initialize(name, hobby, city, state, zip)
		@name = name
		@hobby = hobby
		@city = city
		@state = state
		@zip = zip
	end
		
end
 
jim = Person.new("Jim", "swimming","Dallas", "Texas", 75227)
ray = Person.new("Ray", "jazz","Phoenix", "Arizona", 75217)
bob = Person.new("Bob", "painting","Austin", "Texas", 78750)
joe = Person.new("Joe", "cooking","Waco", "Texas", 76706)
 
peeps = [jim, ray, bob, joe]

# Iterate over the peeps array to create this hash: 
# p_hash = {
# 	"Jim" => {
# 		"hobby" => "swimming",
# 		"address" => {
# 			"city" => "Dallas",
# 			"state" => "Texas",
# 			"zip" => 75227
# 		}
# 	},
# 	"Ray" => {
# 		"hobby" => "jazz",
# 		"address" => {
# 			"city" => "Dallas",
# 			"state" => "Texas",
# 			"zip" => 75227
# 		}
# 	},
 
# 	# etc, etc
 
# }

p_hash = {}
peeps.each do |person| 
    p_hash[person.name] = 
    	{"hobby" => person.hobby,
    	"address" => 
    		{"city" => person.city,
     		"state" => person.state,
 			"zip" => person.zip
    		}
    	} 
end

############
# Exercise 2
############
 
first_name = "John"
last_names = ["Smith", "Q", "Ellis", "Alberts"]
 
# create an array of ["John Smith", "John Q", "John Ellis", "John Alberts"]
names = last_names.map {|last| "#{first_name} #{last}"}
 
############
# Exercise 3
############
 
class Pet
	attr_reader :name, :type
	def initialize(name, type)
		@name = name
		@type = type
	end
end
 
buzz = Pet.new("Buzz", "cat")
fido = Pet.new("Fido", "dog")
fudge = Pet.new("Fudge", "cat")
roger = Pet.new("Roger", "dog")
crispy = Pet.new("Crispy", "dog")
 
pet_arr = [buzz, fido, fudge, roger, crispy]
 
# print these sentences using pet_arr:
# Buzz is a cat
# Fido is a dog
# etc, etc
 
pet_arr.each {|pet| puts "#{pet.name} is a #{pet.type}"}

# create this hash using the pet_arr:
# pet_hash = {
# 	"dog" => 3,
# 	"cat" => 2
# }
pet_hash = Hash.new(0)
pet_arr.each {|pet| pet_hash[pet.type] += 1}

############################################################################################################################
############################################################################################################################

# Use an each loop on the outter array and print out the information about each
# of my friends. 
# For example, you might print 'Bob is a builder'
 
my_friends = [
    {
        :name => "Bob",
        :occupation => "Builder"
    },
    {
        :name => "Dora",
        :occupation => "Explorer"
    },
    {
        :name => "Mandy",
        :occupation => "Handy(wo)man"
    },
]
 
my_friends.each {|friend| puts "#{friend[:name]} is a #{friend[:occupation]}"}
 
############################################################################################################################
############################################################################################################################
 
# Iterate through the array of the Smith family members using `each` and add the last name to each person. The array should look like this at the end: `["John Smith", "Jane Smith", "Jacob Smith"]`
 
smith_family = ["John", "Jane", "Jacob"]
last_name = "Smith"
 

smith_family.map! {|smith| "#{smith} #{last_name}"} 

smith_family.each_with_index {|smith,index| smith_family[index] = "#{smith} #{last_name}"} 

index = 0
smith_family.each do |smith| 
	smith_family[index] = "#{smith} #{last_name}"
	index += 1
end


 
############################################################################################################################
############################################################################################################################

# First look at this code and then complete the exercises that follow
 
class Pet
  attr_accessor :age, :name, :type
  
  def initialize(type, name, age)
    @type = type
    @name = name
    @age = age
  end
end
 
marlo = Pet.new('dog', 'Marlo', 3)
boots = Pet.new('cat', 'Boots', 5)
goldy = Pet.new('gold fish', 'Goldy', 1)
 
pet_array = [marlo, boots, goldy]
 
# using pet_array, create an array of just the pet names: ["Marlo", "Boots", "Goldy"]. Try it using the method 'map'
# write the answer here
pet_names = pet_array.map {|pet| pet.name}

# create a method that goes through pet_array and increments each pet's age by 1
# write the answer here
pet_array.each {|pet| pet.age += 1 }
 
# using pet_array, select the pet with the name 'Boots'. Try doing this with the 'select' and 'find' method. 
# write the answer here

pet_array.select {|pet| pet.name == "Boots"} 
## returns array of pet

pet_array.find {|pet| pet.name == "Boots"} 
##returns pet

# using pet_array, select the pets with age greater than 1. Try doin gthis with the 'select' and 'find' method.
# write the answer here
pet_array.select {|pet| pet.age > 1} 
##returns all instances

pet_array.find_all {|pet| pet.age > 1} 
##returns all instances--as opposed to #find which returns the first

# what is the difference between the methods 'select' and 'find'? 
# write the answer here

 
############################################################################################################################
############################################################################################################################
 
# what will be the value of x after we run this line of code? 
x = nil && "hello world"  # => nil
# why is that the case?
# "nil && whatever" returns nil (since && requires both statements to be truthy)
# (Since it's falsy, we stop interpreting before we get to "hello world".)
 
# what will be the value of x after we run this line of code? 
x = "goodbye" && "hello world" #=> "hello world"
# why is that the case?
# Both elements are truthy, but x && y returns the later statement (or last evaluated statement)
 
# what will be the value of x after we run this line of code? 
x = "goat" || "cat" # => "goat"
# why is that the case?
# The first element is truthy, so with the || operator we stop interpreting; 
# the first truthy element is returned?
 
# what will be the value of x after we run this line of code?
x = nil ||"eureka" # => "eureka"
# why is that the case?
# Since nil is falsy, and we have the || operator, we go to the second half and assign that to x
