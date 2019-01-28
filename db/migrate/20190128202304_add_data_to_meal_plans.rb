class AddDataToMealPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :meal_plans, :image, :string
    add_column :meal_plans, :uri, :string
    add_column :meal_plans, :healthlabel, :string
    add_column :meal_plans, :ingredients, :text
    add_column :meal_plans, :ingredientlines, :text
  end
end
