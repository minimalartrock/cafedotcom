# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    @comment = @like.comment
    @shop = @comment.shop
    respond_to :js if @like.save
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @comment = @like.comment
    respond_to :js if @like.destroy
  end

  private

  def like_params
    params.permit(:comment_id)
  end
end
