class VariantValue < ApplicationRecord
    validates :variant_id, presence: true
    validates :value, presence: true

    belongs_to :variant
    has_many :product_variants
end
