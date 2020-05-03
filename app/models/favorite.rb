class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  scope :liked_people, ->(shop_id) { User.joins(:favorites).merge(Favorite.order(:created_at)).where("shop_id = ?", shop_id).first(5) }

  def self.liked_by(user_id, shop_id)
    Favorite.exists?(user_id: user_id, shop_id: shop_id)
  end
end
