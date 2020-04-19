# frozen_string_literal: true

class Comment < ApplicationRecord
  # enum status: { vacant: 0, usually: 1, crowded: 2 }
  has_one :congestion, dependent: :destroy
  accepts_nested_attributes_for :congestion, allow_destroy: true
  belongs_to :user
  belongs_to :shop
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  # scope :recent, ->(count) { order(updated_at: :desc).limit(count) }

  validates :comment, presence: true, length: { maximum: 300 }

  scope :followed_by, ->(comment) { User.joins(:likes).merge(Like.order(:created_at)).where("comment_id = ?", comment.id).first(10) }

  def liked_by(user)
    Like.find_by(user_id: user.id, comment_id: id)
  end
end
