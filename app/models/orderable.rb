class Orderable < ApplicationRecord
    belongs_to :product
    belongs_to :cart
    belongs_to :variant
  
    def total
      if variant && variant.price
        variant.price * quantity
      else
        0
      end
    end
  end
  