class Shop < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name", "address"]
  end

  def self.ransackable_assosiations(auth_object = nil)
    []
  end

  def number_of_people_saying_crowded(shop)
    Comment.where(shop_id: shop.id).crowded.count
  end

  def number_of_people_saying_usually(shop)
    Comment.where(shop_id: shop.id).usually.count
  end

  def number_of_people_saying_vacant(shop)
    Comment.where(shop_id: shop.id).vacant.count
  end

  def rate_average()
    if self.comments.any?
      self.comments.average(:rate).floor(1).to_f
    else
      return 0.0
    end
  end
end
