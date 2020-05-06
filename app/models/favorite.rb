class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  def self.liked_by(user_id, shop_id)
    Favorite.exists?(user_id: user_id, shop_id: shop_id)
  end
end
