# frozen_string_literal: true

class ShopsController < ApplicationController
  include CongestionsHelper

  def index
    case params[:category]
    when "vacant"
      @q = get_vacant_shops
      @shops = @q.page(params[:page])
    when "outret"
      @q = Shop.where(outret: true)
      @shops = @q.page(params[:page])
    when "wifi"
      @q = Shop.where(wifi: true)
      @shops = @q.page(params[:page])
    else
      @q = Shop.ransack(params[:q])
      @shops = @q.result(distinct: true).page(params[:page])

      @popular_shops = Shop.find(Comment.group(:shop_id).order("count(shop_id) desc").limit(5).pluck(:shop_id))
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @comments = @shop.comments.order(created_at: :desc).page(params[:page]).per(5)
  end
end
