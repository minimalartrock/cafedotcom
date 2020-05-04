# frozen_string_literal: true

class UsersController < ApplicationController
  include ApplicationHelper

  before_action :correct_user?

  def show
    @user = User.find(params[:id])
  end
end
