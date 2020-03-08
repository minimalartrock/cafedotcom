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
    render_404 unless user_signed_in? && current_user.id == params[:id].to_i
  end

  def admin?
    render_404 unless user_signed_in? && current_user.admin?
  end
end

def render_404
  render template: 'errors/not_found', status: 404, layout: 'application', content_type: 'text/html'
end
