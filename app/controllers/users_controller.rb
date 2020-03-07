# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :correct_user?, only: %i[show edit]
  before_action :admin?, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def correct_user?
    unless user_signed_in? && current_user.id == params[:id].to_i
      redirect_to root_path
    end
  end

  def admin?
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end
