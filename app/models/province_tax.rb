class ProvinceTax < ApplicationRecord
  belongs_to :order

  validates :id, presence: true
  validates :province, presence: true
  validates :gst, presence: true
  validates :pst, presence: true
  validates :hst, presence: true

  validates :id, numericality: { only_integer: true }
  # below allows all letters
  validates :province, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :gst, numericality: true
  validates :pst, numericality: true
  validates :hst, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "province", "gst", "pst", "hst", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["order"]
  end
end