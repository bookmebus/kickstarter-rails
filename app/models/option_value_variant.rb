class OptionValueVariant < ApplicationRecord
    validates_presence_of :variant_id, :option_value_id

    belongs_to :option_value
    belongs_to :variant
end
