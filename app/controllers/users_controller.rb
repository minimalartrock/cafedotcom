class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to user_url, notice: "ユーザー「#{user.name}」を削除しました。"
	end
end
