class Cart < ApplicationRecord
    has_many :orderables
    def total
        orderables.to_a.sum { |orderable| orderable.total }
      end
end
