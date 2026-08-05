class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :province_tax
  has_many :line_items

  validates :id, presence: true
  validates :order_total_at_purchase, presence: true
  validates :delivery_address, presence: true
  validates :date_of_purchase, presence: true

  validates :id, numericality: { only_integer: true }
  validates :order_total_at_purchase, numericality: true
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :delivery_address, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :date_of_purchase, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letters numbers and some symbols" }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "order_total_at_purchase", "delivery_address", "email", "name", "date_of_purchase", "order_item_id", "province_tax_id", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["province_tax","line_items", "customer"]
  end
end
