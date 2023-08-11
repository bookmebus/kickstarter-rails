class OptionValue < ApplicationRecord
    validates_presence_of :value

    belongs_to :option_type
    has_many :option_value_variants, dependent: :destroy
end
