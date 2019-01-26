class AddPicturePatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :img, :string
  end
end
