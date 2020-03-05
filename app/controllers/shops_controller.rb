# frozen_string_literal: true

class ShopsController < ApplicationController
  # skip_before_action :login_required, only: %i[index show]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).page(params[:page])
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
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    redirect_to shops_path(@shop), notice: "「#{shop.name}」を更新しました。"
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_url, notice: "店「#{shop.name}」を削除しました。"
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :map, :image, :url)
  end
end
