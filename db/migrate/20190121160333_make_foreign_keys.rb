class MakeForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_column :diagnoses, :doctor_id, :integer
    add_column :patients, :sex, :string
    add_column :patients, :age, :string
    add_column :diagnoses, :patient_id, :integer
    add_column :diets, :diagnosis_id, :integer
    add_column :doctors, :specialization, :string
  end
end
