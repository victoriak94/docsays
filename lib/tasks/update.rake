require File.dirname(__FILE__) + "/../../config/environment"

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
			@mealplan = MealPlan.new
			@mealplan.name = meal["label"]
			@mealplan.image = meal["image"]
 			@mealplan.uri = meal["uri"]
			@mealplan.healthlabel = meal["healthLabels"]
			@mealplan.ingredients = meal["ingredients"]
			@mealplan.ingredientlines = meal["ingredientLiness"]
			@mealplan.save
		end

  end
end
