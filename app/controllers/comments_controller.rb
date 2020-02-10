class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@comment = Comment.new(comment_params)
    @shop = @comment.shop
    if @comment.save
      redirect_to shop_path(@shop.id), notice: "コメントを登録しました"
    else
      flash[:alert] = "コメントに失敗しました"
    end
  end

	def destroy
		@comment = Comment.find(params[:id])
    @shop = @comment.shop
    if @comment.destroy
      redirect_to shop_path(@shop.id), notice: "コメントを削除しました"
    else
      flash[:alert] = "コメントの削除に失敗しました"
    end
	end

	private

	def comment_params
		params.require(:comment).permit(:user_id, :shop_id, :comment)
	end
end
