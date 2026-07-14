class Item < ApplicationRecord
  has_one :category
  has_one_attached :item_image_path

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "description", "artist", "price", "quantity", "category_id", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
