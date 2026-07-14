class Order < ApplicationRecord
  belongs_to :customer
  has_one :province_tax
  has_many :order_item

  validates :id, presence: true
  validates :order_total_at_purchase, presence: true
  validates :delivery_address, presence: true
  validates :date_of_purchase, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "order_total_at_purchase", "delivery_address", "date_of_purchase", "order_item_id", "province_tax_id", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["province_tax","order_item", "customer"]
  end
end
