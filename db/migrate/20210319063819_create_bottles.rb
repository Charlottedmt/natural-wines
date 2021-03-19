class CreateBottles < ActiveRecord::Migration[6.0]
  def change
    create_table :bottles do |t|
      t.string :name
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
