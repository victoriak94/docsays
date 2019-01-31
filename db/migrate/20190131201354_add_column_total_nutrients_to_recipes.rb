class AddColumnTotalNutrientsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :total_nutrients, :string
  end
end
