class Item < ApplicationRecord
  belongs_to :category
  has_one_attached :item_image_path do |attachable|
    attachable.variant :list_thumbnail, resize_to_limit: [200, 200], preprocessed: true
    attachable.variant :item_view, resize_to_limit: [500, 500], preprocessed: true
  end

  validates :title, presence: true
  validates :description, presence: true
  validates :artist, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :title, format: { with: /\A[\w.',?!…:;()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :description, format: { with: /\A[\w.',?!…:;()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :artist, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letter numbers and some symbolss" }
  validates :price, numericality: true
  validates :quantity, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "description", "artist", "price", "quantity", "category_id", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
