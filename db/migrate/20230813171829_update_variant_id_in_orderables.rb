class UpdateVariantIdInOrderables < ActiveRecord::Migration[7.0]
  def up
    Orderable.find_each do |orderable|
      orderable.update(variant_id: orderable.product.variants.first.id)
    end

    change_column_null :orderables, :variant_id, false
    add_foreign_key :orderables, :variants, column: :variant_id
  end

  def down
    remove_foreign_key :orderables, column: :variant_id
    change_column_null :orderables, :variant_id, true
  end
end
