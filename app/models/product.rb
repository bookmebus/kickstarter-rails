class Product < ApplicationRecord
    validates_presence_of :name, :description

    has_many :variants
    has_many :option_type_products
    has_many :option_types, through: :option_type_products
end
