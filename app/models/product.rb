class Product < ApplicationRecord
    validates :name, presence: true
    validate :description

    has_many :product_variants
    has_many :product_details, through: :product_variants
end
