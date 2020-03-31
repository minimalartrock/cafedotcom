# frozen_string_literal: true

class UsersController < ApplicationController
  include ApplicationHelper

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
end
