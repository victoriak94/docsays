

namespace :update do

	desc "Update Recipe API"
  task add_recipe: :environment do
		puts "starting task"
		require 'httparty'
    response = HTTParty.get("https://api.edamam.com/search?q=health&app_id=1a5ac459&app_key=263e9d8bf34384b63230ee6f193da30b")
    recipe_list_name  = response["hits"]
		puts "recipe list name"
		recipe_list_name.each do |meal|
			puts "ingesting meal"
			@recipe = Recipe.create
			puts ".....................................#{meal}"
			@recipe.name = meal["recipe"]["label"]
			@recipe.image = meal["recipe"]["image"]
 			@recipe.url = meal["recipe"]["url"]
			@recipe.health_label = meal["recipe"]["healthLabels"]
			@recipe.ingredient_lines = meal["recipe"]["ingredientLines"]
			@recipe.calories = meal["recipe"]["calories"]

			@recipe.save
		end

  end
end
