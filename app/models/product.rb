class Product < ApplicationRecord
    validates_presence_of :name, :description
 
    has_many :product_variants
    has_many :product_details, through: :product_variants
end
