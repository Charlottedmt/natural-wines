class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.references :location, null: false, foreign_key: true
      t.references :bottle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
