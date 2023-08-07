class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :profile_image
      t.string :cover_image
      t.string :product_type
      t.string :email
      t.string :phone
    
      t.timestamps
    end
  end
end
