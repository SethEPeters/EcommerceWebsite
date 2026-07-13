class OrderItem < ApplicationRecord
  belongs_to :order

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "item_image_path", "price_at_purchase", "date_price_good_until", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["order"]
  end
end
