class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart, optional: true
  belongs_to :order, optional: true



  # LOGIC
  def total_price
    quantity * unit_price
  end
end
