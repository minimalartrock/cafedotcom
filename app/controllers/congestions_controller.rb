class CongestionsController < ApplicationController
	before_action :login_required
	before_action :already_posted?

	def create
		@status = Shop.find(params[:shop_id])
		@congestion = Congestion.new(congestion_params)
		respond_to :js if @congestion.save
  end

	private

  def congestion_params
    params.permit(:status, :shop_id, :user_id)
	 end

	def login_required
    redirect_to login_path, notice: 'ログインが必要です' unless current_user
	end

	def already_posted?
    redirect_to login_path, notice: 'ログインが必要です' unless current_user if Congestion.already_posted(current_user) > 0
  end

end
