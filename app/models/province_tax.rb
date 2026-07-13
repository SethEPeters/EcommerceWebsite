class ProvinceTax < ApplicationRecord
  belongs_to :order

  def self.ransackable_attributes(auth_object = nil)
    ["id", "province", "gst", "pst", "hst", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["order"]
  end
end