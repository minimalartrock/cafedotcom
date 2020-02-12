class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

  validates :rate, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true

  def liked_by(user)
    Like.find_by(user_id: user.id, comment_id: id)
  end
end
