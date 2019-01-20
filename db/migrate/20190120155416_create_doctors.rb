class CreateDoctors < ActiveRecord::Migration[5.2]
  has_and_belongs_to_many :diagnoses
  def change
    create_table :doctors do |t|
      t.string :name

      t.timestamps
    end
  end
end
