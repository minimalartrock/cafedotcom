# frozen_string_literal: true

class Comment < ApplicationRecord
  has_one :congestion, dependent: :destroy
  accepts_nested_attributes_for :congestion, allow_destroy: true
  belongs_to :user
  belongs_to :shop
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  # scope :recent, ->(count) { order(updated_at: :desc).limit(count) }
  scope :within_1_hour, -> { where(created_at: Time.current.ago(1.hour)..Time.current) }

  validates :comment, presence: true, length: { maximum: 300 }

  scope :followed_by, ->(comment) { User.joins(:likes).merge(Like.order(:created_at)).where("comment_id = ?", comment.id).first(10) }
  scope :commented_on, ->(shop_id) { User.joins(:comments).where("shop_id = ?", shop_id).distinct.first(5) }
  scope :number_of_comments, ->(shop_id) { Comment.where(shop_id: shop_id).count }

  def liked_by(user)
    Like.find_by(user_id: user.id, comment_id: id)
  end
end
