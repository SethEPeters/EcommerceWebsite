class Customer < ApplicationRecord
  has_many :order

  def self.ransackable_attributes(auth_object = nil)
    ["id", "first_name", "last_name", "street_address", "province", "order_id", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["order"]
  end
end
