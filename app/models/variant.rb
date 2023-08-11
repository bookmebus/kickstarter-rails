class Variant < ApplicationRecord
    validates_presence_of :product_id, :price, :image, :quantity
 
    has_many :variant_values
    has_many :product_variants, through: :variant_values
end
