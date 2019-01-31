class AddColumnCaloriesToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :calories, :integer
  end
end
