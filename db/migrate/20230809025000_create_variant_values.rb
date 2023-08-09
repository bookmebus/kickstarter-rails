class CreateVariantValues < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_values do |t|
      t.references :variant, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
