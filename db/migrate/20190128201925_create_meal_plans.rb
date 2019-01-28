class CreateMealPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_plans do |t|
      t.string :image
      t.string :uri
      t.string :healthlabel
      t.text :ingredients
      t.text :ingredientlines
    end
  end
end
