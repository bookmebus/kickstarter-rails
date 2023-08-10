class OptionTypeProduct < ApplicationRecord
    validates_presence_of :product_id, :option_type_id

    belongs_to :product
    belongs_to :option_type
end
