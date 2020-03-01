# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :login_required, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name admin])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name admin avatar])
  end

  private

  def login_required
    redirect_to login_path, notice: 'ログインが必要です' unless current_user
  end
end
