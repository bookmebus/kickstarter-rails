class ProductVariant < ApplicationRecord
    validates :product_detail_id, presence: true
    validates :variant_value_id, presence: true

    belongs_to :product_detail
    belongs_to :variant_value

    belongs_to :product, through: :product_detail
    belongs_to :variant, through: :variant_value
end
