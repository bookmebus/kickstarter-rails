class Product < ApplicationRecord
    validates_presence_of :name, :description

    has_many :variants, dependent: :destroy
    has_many :option_type_products, dependent: :destroy
    has_many :option_types, through: :option_type_products
    has_many :orderables
    has_many :carts, through: :orderables
end
