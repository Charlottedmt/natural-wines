class AddPhotoToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :photo, :string
  end
end
