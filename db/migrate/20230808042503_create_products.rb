class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :quantity
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.decimal :discount_price, precision: 10, scale: 2
      t.boolean :is_out_of_stock, default: false
      t.references :vendor, foreign_key: true
      t.timestamps
    end
  end
end
 