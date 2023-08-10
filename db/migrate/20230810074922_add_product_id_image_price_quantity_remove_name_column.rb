class AddProductIdImagePriceQuantityRemoveNameColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :image, :string
    add_column :variants, :price, :decimal
    add_column :variants, :quantity, :integer
    add_column :variants, :product_id, :integer
    add_foreign_key :variants, :products, column: :product_id
    remove_column :variants, :name, :string
  end
end
