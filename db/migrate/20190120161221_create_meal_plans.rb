class CreateMealPlans < ActiveRecord::Migration[5.2]
  belongs_to :patients
  def change
    create_table :meal_plans do |t|
      t.string :name

      t.timestamps
    end
  end
end
