class ChangeLocationsColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :locations, :photo, :photo_url
  end
end
