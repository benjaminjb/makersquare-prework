require_relative 'Cookbook'


mex_cuisine = Cookbook.new("Mexican Cooking")
burrito = Recipe.new("Bean Burrito", ["tortilla", "bean"], ["heat beans", "place beans in tortilla", "roll up"])
smoothie = Recipe.new("Smoothie", ["protein powder", "liquid", "fruit"], ["place ingredients in blender", "blend", "enjoy"])

puts mex_cuisine.title # Mexican Cooking
puts burrito.title # Bean Burrito
p burrito.ingredients # ["tortilla", "bean", "cheese"]
p burrito.steps # ["heat beans", "heat tortilla", "place beans in tortilla", "sprinkle cheese on top", "roll up"]

puts

mex_cuisine.title = "Mexican Recipes"
puts mex_cuisine.title # Mexican Recipes

burrito.title = "Veggie Burrito"
burrito.ingredients = ["tortilla", "tomatoes"]
burrito.steps = ["heat tomatoes", "place tomatoes in tortilla", "roll up"]

puts

p burrito.title # "Veggie Burrito"
p burrito.ingredients # ["tortilla", "tomatoes"]
p burrito.steps # ["heat tomatoes", "place tomatoes in tortilla", "roll up"]

puts 

p smoothie.title 
# smoothie.low_fat
p smoothie.ingredients 
p smoothie.steps 

# puts 

# p mex_cuisine.recipes # []
mex_cuisine.add_recipe(burrito)
mex_cuisine.add_recipe(smoothie)
# p mex_cuisine.recipes # [#<Recipe:0x007fbc3b92e560 @title="Veggie Burrito", @ingredients=["tortilla", "tomatoes"], @steps=["heat tomatoes", "place tomatoes in tortilla", "roll up"]>]

# puts

# mex_cuisine.recipe_titles # Veggie Burrito
# mex_cuisine.recipe_ingredients("Veggie Burrito") # These are the ingredients for Veggie Burrito: ["tortilla", "bean"]

# puts

# burrito.print_recipe
# smoothie.print_recipe

# puts

# mex_cuisine.print_cookbook

# puts

# smoothie.low_fat
# p smoothie.ingredients 

ugh = Recipe.new("", [], [])
ugh.gross(burrito,smoothie)
ugh.print_recipe
# mex_cuisine.add_recipe(ugh)
# mex_cuisine.print_cookbook