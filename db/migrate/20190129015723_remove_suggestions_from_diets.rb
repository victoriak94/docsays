class RemoveSuggestionsFromDiets < ActiveRecord::Migration[5.2]
  def change
    remove_column :diets, :Suggestions
  end
end
