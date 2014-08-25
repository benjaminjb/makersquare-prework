# What does the third line evaluate to?
 
x = 5
x += 3
x / 2 + 10   #=> 14
 
##############################################################
 
# Get the first element of 'teams'
 
teams = ["Knicks", "Celtics", "76ers", "Raptors"]
 
 teams[0]
 
##############################################################
 
# Provide 2 ways to get the last element of 'teams'. 
 
teams = ["Giants", "Cowboys", "Eagles", "Steelers"]
 
teams[3] 
teams[-1]
teams.last
 
##############################################################
 
# Provide two ways to add the word 'Shady' to the end of 'rapper'
 
rapper = ["The", "Real", "Slim"]
 
rapper << "Shady"
rapper.push("Shady") 
 
##############################################################
 
# Iterate through the following array and print each
# element to the screen.
 
ary = ["MakerSquare", "is", "cool!"]
 
ary.each {|x| puts x} 
 
##############################################################
 # STAR - do again with map method
# Iterate through 'names' and return a new array with each
# name capitalized.
 
names = ["nick", "mike", "shehzan", "gilbert"]

cap_names = []
names.each {|x| cap_names << x.capitalize}

cap_names = names.map {|x| x.capitalize}
 
 
##############################################################
 
# What is the value of 'y'?
 
x = "I love java, er, I mean ruby!"
y = x.split[2]   #=> "java,"
 
##############################################################
 
# What are two ways to concatenate the following strings?
 
first = "Ruby "
second = "forever!!!"
 
first + second
first << second # mutates
"#{first}#{second}"
 
 
##############################################################
 
# Create a new hash that contains some information about yourself
 
me =  #=> {:name=>"Ben", :activity=>"traveling"}
 
 
##############################################################
 
# The formula to convert Fahrenheit temperatures to Celsius is:
#    1. subtract 32 from the Fahrenheit temperature
#    2. multiply by 5
#    3. divide by 9
# Write a method called f2c that takes a temperature and in
# Fahrenheit and returns its Celsius equivalen
 
 
=begin

def f2c(temperature)
  ((temperature - 32) * 5) / 9.0
end

=end
 
 
 
##############################################################
 
# What does the following method return?
# Next to each call to 'some_method' write
# a comment that says what the return value is.
 
def some_method(x)
  if x > 5 && x < 10
    return :a
  elsif x < 5
    return :b
  end    
 
  :c
end

#return as exit from function
 
some_method(3)    #=>  :b
some_method(12)   #=>  :c
some_method(7)    #=>  :a
 
##############################################################
 
# What is the output of the following expression.
 
if !"nick"
  puts "He's a cool guy!"
end

# Nothing (I think). The string "nick" is truthy, so ! makes it falsy, so we skip the puts line

# it returns a nil
##############################################################

# What is the value of x?

def check_truth?(statement)
  if statement == nil
   "Neither exactly true nor false"
  elsif statement == true
   "It's true!"
  else
   "I admit, tis' false."
  end
end

x = check_truth?("Ruby is awesome!") 

#=> x = "It's true."
# I'm actually not sure about this--a string is truthy (I think), but is truthy == true?

# actual answer: "I admit, tis' false."
# nil and false are the only falsy
##############################################################

# What is the value of x?

def consume_arr(y)
 y.each { |elem| puts (elem*2) }
end

x = consume_arr([2,4,6])

#=> [4,8,12]
# No, wait, now I'm looking at it again--and I feel like there's a trick here. "puts" prints to the output,
# which is different than returning. In which case I'm not entirely sure what gets returned and assigned to x.
 
 # correction: each returns the original array/object
 # note: puts returns nil
 # answer is actually [2,4,6]
##############################################################
 
 
# The following 3 lines of code have errors. Please correct them.
# You can change them in place.
 
var_name = "Nick McDonnough"
pop_punk = "Blink" + "182"
7.0 / 2 == 3.5   # there are multiple acceptable answers for this one.
 
##############################################################
 
# What is the output of the following code 
 
def recursion(x)
  return "HEYO!" if x >= 5
  puts x
  recursion(x += 1)
end
 
recursion(0)   #=>  0
# 1
# 2
# 3
# 4
# "HEYO!" 

 
recursion(6)   #=> "HEYO!"


# puts("some string")
 
########
# STAR - do again with #map
# Given the following data structure please answer the
# questions below it
 
ballers = [
  {:name => "Michael Jordan", :team => "Chicago"},
  {:name => "Larry Bird", :team => "Boston"},
  {:name => "Isiah Thomas", :team => "Detroit"}
]
 
# How would you access Larry Bird's team?
# ballers[1][:team]
 
# How would you return an array containing only the player names?
# new_ary = []
# ballers.each {|x| new_ary << x[:name]}
# new_ary

# new_ary = ballers.map {|x| x[:name]}
 
##############################################################
 
# Using the above hash, what does the following return?
ballers[-1].size    #=> 2 (does Hash#size return the number of key-value pairs?)
 
##############################################################
 
# Return the cast members of The Sopranos as a single
# string separated by commas.
 
tv_shows = {
  "Mad Men" => {:network => "AMC", :cast => ["John Hamm", "John Slattery", "Elizabeth Olson"]},
  "Dexter" => {:network => "Showtime", :cast => ["Michael C. Hall", "Jennifer Carpenter", "CS Lee"]},
  "The Sopranos" => {:network => "HBO", :cast => ["James Gandolfini", "Michael Imperioli", "Edie Falco"]}
}
 
# tv_shows["The Sopranos"][:cast].join(", ")
 
##############################################################
 
# Iterate through 'words' and return the following sentence:
#    "I'm excited for MakerSquare!""
 
words = [
  ["I'm", "eating", "pizza"],
  ["Excited", "begins", "with", "E"],
  ["For", "sale"],
  ["MakerSquare", "is", "awesome!"]
]
 
# result = ""
# words.each {|x| result << x[0]}
# result.sub("E","e").sub("F","f")+("!")
 # ALTERNATIVE TO EXPLORE
 # result = []
# words.each {|x| result << x[0]}

# result = words.map {|x| x[0].downcase}
# result.first.capitalize!
# result.last.capitalize!
# result.join(" ")+("!")

##############################################################
 
# How would I access the value "Austin" in this hash?
 
person = {
  :name => "Nick McDonnough",
  :age => 28,
  :address => {
    :street => "2520 Elmont St",
    :city => "Austin",
    :state => "TX"
  }
}

# person[:address][:city]

 
##############################################################

# Iterate through 'nums' and return a new array containing
# only numbers larger than 10. Bonus if the array is sorted
# from highest to lowest.

# over_ten = []
# nums = [2, 9, 3, 12, 7, 5, 99, 5, 62]
# over_ten << nums.select {|num| num > 10 }
# over_ten.sort!.reverse!

# Not sure about that last part

# Correction

# nums = [2, 9, 3, 12, 7, 5, 99, 5, 62]
# over_ten = nums.select {|num| num > 10 }
# over_ten.sort!.reverse!


##############################################################
 
# What does the 'initialize' method do?
# A sentence or two will suffice.

# initialize sets the state of a new instance of a class 
# runs immediately with .new
 
##############################################################
 
# Create a Person class based off of this behavior
# This will take up many lines. You can start your answer here.
class Person
  attr_reader :age
  attr_writer :kids

  def initialize(name,age)
    @name = name
    @age = age
    @kids = []
  end

  def kids
    @kids
  end

  def name
    @name
  end

  def birthday
    @age += 1
  end

  def family
    puts "#{@name} has #{kids.length} children:"
    names = @kids.map {|kid| kid.name} 
    puts names.join(",\n")
  end
end

 
bobby = Person.new("Bobby", 28)
bobby.age  #=> 28
bobby.birthday
bobby.birthday
bobby.age  #=> 30
 
tim = Person.new("Tim", 1)
sam = Person.new("Sam", 1)
 
bobby.kids << tim
bobby.kids << sam
 
bobby.family  #=> "Bobby has 2 children:
              #=>  Tim,
              #=>  Sam"
 
##############################################################
 
# Create a new class Person that is initialized with a name and an age 
# (Yes, we know that the code below does not initialize the class with an age).
# In the Person class create a method 'talk' that takes a single parameter
# and prints it to the screen.
# Create a Singer class that inherits from Person. Singer should have a
# method 'sing'. The following code describes the behaviour of the classes.
 
# This will take up many lines. You can start your answer here.
class Person
  def initialize(name,age=0)
    @name = name
    @age = age
  end

  def greet
    "Hey, there! I'm #{@name}"
  end

  def talk(saying)
    puts saying
  end
end

class Singer < Person
  def sing
    puts "R-E-S-P-E-C-T. Find out what it means to me!"
  end
end 
 
aretha = Singer.new("Aretha Franklin")
aretha.greet  #=> "Hey, there! I'm Aretha Franklin!"
aretha.sing   #=> "R-E-S-P-E-C-T. Find out what it means to me!"
 
nick = Person.new("Nick")
nick.greet   #=> "Hey, there! I'm Nick!"
nick.talk("Prework is super important!")  #=> "Prework is super important!"
nick.sing  #=> NoMethodError


##############################################################
 
# Rewrite the code below to expand the attr's  into the
# methods they represent. You can simply replace the code.
 
class Cookie

  def initialize type, calories
    @type = type
    @calories = calories
  end

  def type
    @type
  end

  def calories
    @calories
  end

  def calories=(val)
    @calories = val
  end

end 
 
##############################################################
 
# What is a class variable? Why might you use one?
# Just write a sentence below. You can provide some code if
# you're not sure how to word it.

# A class variable (e.g., @@class_variable) could be declared if you want to keep some state or data 
# for the class as a whole (as in the exercise where we wanted the Car class to keep track of how many
# times in total all the car instances had been repainted).
 
 # class variable are shared by all instances, not unique to each
 
##############################################################
 
# What is a block? Please provide a code example along with
# a sentence or two explaining it.

# A block is a chunk of discrete code without a name. In abstract terms, in 
# Array#each {|elem| element procedure}, everything in the curly braces is a block passed to Array#each. 
 

 
##############################################################
 
# Describe the scope of the following variable types. If you have
# trouble putting it to words you can use some code.

 # STAR - elaborate on block variables
# local 
# A local variable is declared and accessible within a method or other block, and is not accessible outside.

# def example
#   x = 5
#   x # => 5
# end
# x # => won't return 5--probably will throw an undeclared error(?)

# instance
# An instance variable exists for a particular instantiation of a class. A Person instance (Billy) of the 
# Person class has name and age as instance variables (Billy.name, Billy.age, if public).

# class
# A class variable exists for the class as a whole and not for any particular instance. Is it accessible
# from any instance? I think so.
 
##############################################################
 
# When you call the 'methods' method you receive a list of
# all methods available to that object based on what class it
# is in. Knowing that please answer the question below.
 
class Test
end
 
x = Test.new
x.methods.count   #=> 54
 
# If we didn't write any methods for our Test class how did it
# the 'methods' method find 54 methods associated with it?

# Test inherits methods from its superclass (Object).