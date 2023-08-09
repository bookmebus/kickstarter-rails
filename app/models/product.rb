class Product < ApplicationRecord
    validates: name, presence: true
    validates: description

    has_many :product_variants
    has_many :product_details, through: :product_variants
end
