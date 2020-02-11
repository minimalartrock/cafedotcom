class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    @comment = @like.comment
    @shop = @comment.shop
    if @like.save
      respond_to :js
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @comment = @like.comment
    if @like.destroy
      respond_to :js
    end
  end

  private

  def like_params
    params.permit(:comment_id)
  end
end
