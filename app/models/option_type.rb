class OptionType < ApplicationRecord
    validates_presence_of :name

    has_many :option_values
    has_many :option_type_products
    has_many :products, through: :option_type_products
end
