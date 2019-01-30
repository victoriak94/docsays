class DropMealPlansTable < ActiveRecord::Migration[5.2]
  def down
    drop_table :meal_plans
  end
end
