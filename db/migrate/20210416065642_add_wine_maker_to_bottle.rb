class AddWineMakerToBottle < ActiveRecord::Migration[6.0]
  def change
    add_column :bottles, :wine_maker, :string
  end
end
