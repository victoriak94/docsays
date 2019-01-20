class CreateDiets < ActiveRecord::Migration[5.2]
  has_and_belongs_to_many :diagnoses
  def change
    create_table :diets do |t|
      t.string :Suggestions
      t.string :name

      t.timestamps
    end
  end
end
