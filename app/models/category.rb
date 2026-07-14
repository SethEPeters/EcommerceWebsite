class Category < ApplicationRecord
  belongs_to :item

  validates :id, presence: true
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["item"]
  end
end
