# frozen_string_literal: true

class Comment < ApplicationRecord
  enum status: { vacant: 0, usually: 1, crowded: 2 }
  belongs_to :user
  belongs_to :shop
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

  validates :comment, presence: true, length: { maximum: 300 }

  def liked_by(user)
    Like.find_by(user_id: user.id, comment_id: id)
  end
end
