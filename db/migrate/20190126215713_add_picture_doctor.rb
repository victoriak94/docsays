class AddPictureDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :img, :string
  end
end
