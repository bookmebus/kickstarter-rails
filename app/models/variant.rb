class Variant < ApplicationRecord
    validates :name, presence: true
 
    has_many :variant_values
    has_many :product_variants, through: :variant_values
end
