class AddVariantIdToOrderables < ActiveRecord::Migration[7.0]
  def change
    add_column :orderables, :variant_id, :integer
  end
end
