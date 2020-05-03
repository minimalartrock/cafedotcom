# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  include ApplicationHelper

  before_action :admin?

  def edit
    @user = User.find(params[:id])
    render template: 'users/edit'
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
end
