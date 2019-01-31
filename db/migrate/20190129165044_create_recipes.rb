class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :patient_id
      t.string :image
      t.string :uri
      t.string :health_label
      t.string :ingredients
      t.string :ingredient_lines

      t.timestamps
    end
  end
end
