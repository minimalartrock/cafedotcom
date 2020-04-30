# frozen_string_literal: true

class Admin::ShopsController < ApplicationController
  include ApplicationHelper

  before_action :admin?

  def index
    @shops = Shop.order(id: :asc)
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to admin_shops_path(@shop), notice: "「#{@shop.name}」を登録しました。"
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
      redirect_to admin_shops_path(@shop), notice: "「#{@shop.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to admin_shops_path, notice: "店「#{shop.name}」を削除しました。"
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :name_kana, :address, :image, :tel, :opentime, :holiday, :outret, :wifi, :latitude, :longitude, :pr_short, :pref_code, :prefname, :areacode_s, :areaname_s)
  end
end
