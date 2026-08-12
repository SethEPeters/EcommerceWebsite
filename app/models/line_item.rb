class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart, optional: true
  belongs_to :order, optional: true



  # LOGIC
  def total_price
    quantity * unit_price
  end

  def self.ransackable_attributes(auth_object = nil)
    ["cart_id", "created_at", "id", "item_id", "order_id", "quantity", "unit_price", "updated_at"]
  end
end
