class FavoritesController < ApplicationController
	before_action :login_required

	def index
		favorites = Favorite.joins(:user).where(user_id: params[:user_id]).select(:shop_id)
		@favorite_shops = Shop.where(id: favorites)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    favorite = Favorite.new(user_id: current_user.id, shop_id: @shop.id)
    respond_to :js if favorite.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = Favorite.find_by(user_id: current_user.id, shop_id: @shop.id)
    respond_to :js if favorite.destroy
	end

	def login_required
    redirect_to login_path, notice: 'ログインが必要です' unless current_user
  end

end
