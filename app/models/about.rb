class About < ApplicationRecord
  validates :about_info, presence: true

  # below allows all letters, numbers,and some symbols
  validates :about_info, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letters numbers and some symbols" }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "about_info", "created_at", "updated_at"]
  end
end
