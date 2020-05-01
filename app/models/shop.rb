# frozen_string_literal: true

class Shop < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :users, through: :favorites
  has_many :congestions

  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true, length: { maximum: 50 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[name address]
  end

  def self.ransackable_assosiations(_auth_object = nil)
    []
  end

  def rate_average
    if comments.any?
      comments.average(:rate).floor(1).to_f
    else
      0.0
    end
  end
end
