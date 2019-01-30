class AddConfirmableToDevisePatients < ActiveRecord::Migration[5.2]
  def up
    add_column :patients, :confirmation_token, :string
    add_column :patients, :confirmed_at, :datetime
    add_column :patients, :confirmation_sent_at, :datetime
    add_index :patients, :confirmation_token, unique: true

    Patient.update_all confirmed_at: DateTime.now
  end

end
