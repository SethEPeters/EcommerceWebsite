class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  belongs_to :cart

  validates :id, presence: true
  validates :title, presence: true
  validates :price_at_purchase, presence: true
  validates :date_price_good_until, presence: true

  validates :id, numericality: { only_integer: true }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :title, format: { with: /\A[\w.',?!…:;()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  validates :price_at_purchase, numericality: true
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :date_price_good_until, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letters numbers and some symbols" }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "price_at_purchase", "date_price_good_until", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["order", "cart"]
  end
end
