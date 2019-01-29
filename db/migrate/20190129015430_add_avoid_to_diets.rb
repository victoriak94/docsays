class AddAvoidToDiets < ActiveRecord::Migration[5.2]
  def change
    add_column :diets, :avoid, :string
    add_column :diets, :eat, :string
  end
end
