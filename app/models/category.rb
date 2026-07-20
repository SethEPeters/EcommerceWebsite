class Category < ApplicationRecord
  has_one :item

  validates :name, presence: true


  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :name, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letters numbers and some symbols" }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["item"]
  end
end
