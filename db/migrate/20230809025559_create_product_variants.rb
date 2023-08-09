class CreateProductVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variants do |t|

      t.timestamps
    end
  end
end
