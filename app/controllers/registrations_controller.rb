# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end

    NotificationMailer.creation_email(@user).deliver_now
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource)
   end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
