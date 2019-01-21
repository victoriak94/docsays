class CreateDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :diets do |t|
      t.string :Suggestions
      t.string :name

      t.timestamps
    end
  end
end
