# frozen_string_literal: true

module CommentsHelper
  def commented_by(comment, user)
    comment.user_id == user.id if user_signed_in?
  end

  def did_you_like_it?(comment)
    comment.liked_by(current_user).present? if user_signed_in?
  end

  def has_new_comment?(shop_id)
    Comment.where(shop_id: shop_id).within_1_hour.exists?
  end
end
