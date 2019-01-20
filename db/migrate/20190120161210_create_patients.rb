class CreatePatients < ActiveRecord::Migration[5.2]
  belongs_to :diets
  def change
    create_table :patients do |t|
      t.string :name

      t.timestamps
    end
  end
end
