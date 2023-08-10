class OptionType < ApplicationRecord
    validates_presence_of :name

    has_many :option_values
    has_many :option_value_variants, through: :option_values
end
