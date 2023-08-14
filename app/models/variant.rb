class Variant < ApplicationRecord
    validates_presence_of :product_id, :price, :image, :quantity
 
    belongs_to :product
    has_many :option_value_variants, dependent: :destroy
    has_many :option_values, through: :option_value_variants

    def option_text
        option_values.map do |option_value|
            option_value.option_type.name + ": " + option_value.value
        end
    end
end
