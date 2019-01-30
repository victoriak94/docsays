class AddReconfirmableToDevisePatients < ActiveRecord::Migration[5.2]
  def up
    add_column :patients, :unconfirmed_email, :string
    Patient.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :patients, :unconfirmed_email
  end
end
