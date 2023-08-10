class DropProdcutDVandVariantValueTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :product_variants
    drop_table :variant_values
    drop_table :product_details
  end
end
