class FavoritesController < ApplicationController
  before_action :login_required

  def index
    favorites = Favorite.joins(:user).where(user_id: params[:user_id]).select(:shop_id)
    @favorite_shops = Shop.where(id: favorites).page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
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
    unless user_signed_in?
      render template: "layouts/login_error"
      return
    end
  end
end
