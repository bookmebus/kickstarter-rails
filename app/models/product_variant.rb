class ProductVariant < ApplicationRecord
    validates :name, presence: true
    validates :image
    validates :quantity
    validates :price

    belongs_to :product
    has_many :product_details
end
