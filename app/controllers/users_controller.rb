# frozen_string_literal: true

class UsersController < ApplicationController
  include ApplicationHelper

	before_action :admin?, only: [:index]

  def index
    @users = User.users.desc
    @administrators = User.administrators.desc
  end

	def show
		@user = User.find(params[:id])
    correct_user?(@user) unless current_user.admin?
  end

  def edit
    @user = User.find(params[:id])
    correct_user?(@user) unless current_user.admin?
  end

	def destroy
    @user = User.find(params[:id])
		redirect_to users_path, notice: "ユーザー「#{@user.name}」を削除しました。"
  end
end
