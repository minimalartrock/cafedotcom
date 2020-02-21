class Shop < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name", "address"]
  end

  def self.ransackable_assosiations(auth_object = nil)
    []
  end
end
