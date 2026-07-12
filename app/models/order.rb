class Order < ApplicationRecord
  belongs_to :customer
  has_one :province_tax
  has_many :order_item
end
