class Cookbook
	attr_accessor :title
		
	def initialize(title)
		@title = title
		@recipes = []
	end

	def recipes
		@recipes
	end

	def add_recipe(rec)
		@recipes << rec
		puts "Added a recipe to the collection: #{rec.title}"
	end

	def recipe_titles
		@recipes.each { |x| puts x.title }
	end

	def recipe_ingredients(rec)
		@recipes.each do |x| 
			if x.title == rec
				puts "These are the ingredients for Veggie Burrito: #{x.ingredients}"
			end
		end
	end

	def print_cookbook
		@recipes.each { |x| x.print_recipe }
	end		
end

class Recipe
	attr_accessor :title
	attr_accessor :steps
	attr_accessor :ingredients

	def initialize(title, ingredients, steps)
    	@title = title
    	@steps = steps
    	@ingredients = ingredients
	end

	def print_recipe
		puts "Recipe: #{title}"
		puts "Ingredients: #{ingredients.join(", ")}"
		puts "Instructions:"
		steps.each { |x| puts (steps.index(x) + 1).to_s + " " + x.capitalize }
	end

	def low_fat
		ingredients.pop
	end

	def gross(recipe, other_recipe)
		@title = recipe.title.to_s + other_recipe.title.to_s
		@ingredients = recipe.ingredients + other_recipe.ingredients 
		@steps = recipe.steps.concat(other_recipe.steps).shuffle
	end
end


