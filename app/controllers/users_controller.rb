# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    require_admin
    @users = User.all
  end

  def show
    redirect_to root_path unless have_privilege
  end

  def edit
    redirect_to root_path unless have_privilege
  end

  def destroy
    redirect_to root_path unless have_privilege
    @user.destroy
    redirect_to user_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

  def have_privilege
    @user = User.find(params[:id])
    current_user == @user || current_user.admin?
  end
end
