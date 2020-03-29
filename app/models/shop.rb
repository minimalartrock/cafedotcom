# frozen_string_literal: true

class Shop < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true, length: { maximum: 30 }
  validates :address, presence: true, length: { maximum: 30 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[name address]
  end

  def self.ransackable_assosiations(_auth_object = nil)
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

  def rate_average
    if comments.any?
      comments.average(:rate).floor(1).to_f
    else
      0.0
    end
  end
end
