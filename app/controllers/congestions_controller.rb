class CongestionsController < ApplicationController
	before_action :login_required

	def create
    congestion = Congestion.new(congestion_params)
    respond_to :js if congestion.save
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    congestion = Congestion.find_by(user_id: current_user.id, shop_id: shop.id)
    respond_to :js if congestion.destroy
	end

	private

  def congestion_params
    params.permit(:status, :shop_id, :user_id)
	 end

	def login_required
    redirect_to login_path, notice: 'ログインが必要です' unless current_user
  end
end
