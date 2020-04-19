module CommentsHelper
  def did_you_like_it?(comment)
    user_signed_in? && comment.liked_by(current_user).present?
  end
end
