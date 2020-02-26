# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  default from: 'cafedotcom@example.com'

  def creation_email(user)
    @user = user
    mail(subject: 'ユーザ登録完了のお知らせ',
         to: @user.email,
         from: 'notification@cafe.com')
  end
end
