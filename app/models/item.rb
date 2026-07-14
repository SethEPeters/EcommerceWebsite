class Item < ApplicationRecord
  has_one :category
  has_one_attached :item_image_path

  validates :id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :artist, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  validates :id, numericality: { only_integer: true }
  validates :title, presence: true
  validates :description, presence: true
  validates :artist, presence: true
  validates :price, numericality: true
  validates :quantity, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "description", "artist", "price", "quantity", "category_id", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
