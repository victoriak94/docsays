class CreateDiagnoses < ActiveRecord::Migration[5.2]
  has_and_belongs_to_many :patients
  has_and_belongs_to_many :doctors
  def change
    create_table :diagnoses do |t|
      t.string :name

      t.timestamps
    end
  end
end
