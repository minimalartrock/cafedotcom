# frozen_string_literal: true

class UsersController < ApplicationController
  include ApplicationHelper

  before_action :admin?, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    correct_user?(@user)
  end

  def edit
    @user = User.find(params[:id])
    correct_user?(@user)
  end
end
