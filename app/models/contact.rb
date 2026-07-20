class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :name, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :email, format: { with: /\A[\w.',?!@()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :phone_number, format: { with: /\A[\d]+\z/, message: "only allows numbers" }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "email", "phone_number", "created_at", "updated_at"]
  end
end
