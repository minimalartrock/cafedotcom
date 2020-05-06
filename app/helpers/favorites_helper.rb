module FavoritesHelper
  def findUser(shop_id)
    User.joins(:favorites).where('favorites.shop_id': shop_id).order(created_at: :desc).first(5)
  end
end
