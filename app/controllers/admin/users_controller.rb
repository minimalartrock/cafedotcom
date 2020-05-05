# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  include ApplicationHelper

  before_action :admin?

  def edit
    @user = User.find(params[:id])
  end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admin_users_path, notice: "「#{@user.name}」を更新しました。"
		else
			render 'edit'
		end
	end

  def index
    @users = User.users.desc
    @administrators = User.administrators.desc
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を削除しました。"
	end

	private

	def user_params
    params.require(:user).permit(:name, :email, :avatar, :admin)
	end
end
