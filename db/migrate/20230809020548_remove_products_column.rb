class RemoveProductsColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :image, :string
    remove_column :products, :quantity, :string
    remove_column :products, :price, :decimal
    remove_column :products, :discount_price, :decimal
    remove_column :products, :is_out_of_stock, :boolean
    remove_column :products, :vendor_id, :bigint
  end
end