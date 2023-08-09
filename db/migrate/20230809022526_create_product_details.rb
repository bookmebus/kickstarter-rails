class CreateProductDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :product_details do |t|
      t.references :product, null: false, foreign_key: true
      t.string :image
      t.string :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
