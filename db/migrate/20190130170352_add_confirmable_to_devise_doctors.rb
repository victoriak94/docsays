class AddConfirmableToDeviseDoctors < ActiveRecord::Migration[5.2]
  def up
    add_column :doctors, :confirmation_token, :string
    add_column :doctors, :confirmed_at, :datetime
    add_column :doctors, :confirmation_sent_at, :datetime
    add_index :doctors, :confirmation_token, unique: true
    add_column :doctors, :unconfirmed_email, :string
    Doctor.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :doctors, :unconfirmed_email
  end
end
