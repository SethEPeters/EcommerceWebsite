class Customer < ApplicationRecord
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :street_address, presence: true
  validates :province, presence: true


  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :first_name, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :last_name, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :email, format: { with: /\A[\w.',?!@()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :street_address, format: { with: /\A[\w.',?!()\- ]+\z/, message: "only allows letters numbers and some symbols" }
  # below allows all letters, numbers, underscore, period, apostrophe, and comma
  validates :province, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters and space" }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "first_name", "last_name", "email", "street_address", "province", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["orders"]
  end
end
