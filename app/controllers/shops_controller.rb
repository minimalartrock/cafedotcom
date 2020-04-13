# frozen_string_literal: true

class ShopsController < ApplicationController
	include ApplicationHelper
	before_action :admin?, only: %i[new create edit update destroy]

  def index
    @q = Shop.ransack(params[:q])
		@shops = @q.result(distinct: true).page(params[:page])
		# 今空いているお店を検索する
		@recently = Shop.recent(4)
  end

  def show
		@shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path(@shop), notice: "「#{@shop.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
		if @shop.update(shop_params)
			redirect_to shops_path(@shop), notice: "「#{@shop.name}」を更新しました。"
		else
			render :edit
		end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_url, notice: "店「#{shop.name}」を削除しました。"
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :url, :image)
  end
end
