# frozen_string_literal: true

module UsersHelper
  def avatar_for(user)
    if user.avatar.attached?
      user.avatar
    else
      "/images/default-avatar.jpg"
    end
  end
end
