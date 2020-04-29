module CommentsHelper
  def did_you_like_it?(comment)
    user_signed_in? && comment.liked_by(current_user).present?
  end

  def has_new_comment?(shop_id)
    Comment.where(shop_id: shop_id).within_1_hour.exists?
  end
end
