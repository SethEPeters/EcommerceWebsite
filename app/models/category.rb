class Category < ApplicationRecord
  belongs_to :item

  validates :id, presence: true
  validates :name, presence: true

  validates :id, numericality: { only_integer: true }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :name, format: { with: /\A[\w.',?!() ]+\z/, message: "only allows letters numbers and some symbols" }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["item"]
  end
end
