class ProductDetail < ApplicationRecord
    validates :name, presence: true
    validate :image
    validate :quantity
    validate :price

    belongs_to :product
    has_many :product_variants
end
