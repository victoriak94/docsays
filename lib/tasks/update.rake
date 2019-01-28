require File.dirname(__FILE__) + "/../../config/environment"

namespace :update do

	desc "Update Recipe API"
  task add_recipe: :environment do
		require 'httparty'
    response = HTTParty.get("https://api.edamam.com/search?q=health&app_id=1a5ac459&app_key=263e9d8bf34384b63230ee6f193da30b")

		recipes = MealPlan.create{
			
		}
  end
end
