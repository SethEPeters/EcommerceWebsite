class OrderItem < ApplicationRecord
  belongs_to :order

  validates :id, presence: true
  validates :title, presence: true
  validates :price_at_purchase, presence: true
  validates :date_price_good_until, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "price_at_purchase", "date_price_good_until", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["order"]
  end
end
