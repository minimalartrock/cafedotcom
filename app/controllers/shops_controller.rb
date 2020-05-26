# frozen_string_literal: true

class ShopsController < ApplicationController
  include CongestionsHelper

  def index
    case params[:category]
    when 'vacant'
      @q = get_vacant_shops
      @shops = @q.page(params[:page])
    when 'location'
      latitude = params[:latitude].to_f
      longitude = params[:longitude].to_f
      @q = Shop.within_box(0.310686, latitude, longitude)
      @shops = @q.page(params[:page])
    when 'outret'
      @q = Shop.where(outret: true)
      @shops = @q.page(params[:page])
    when 'wifi'
      @q = Shop.where(wifi: true)
      @shops = @q.page(params[:page])
    else
      @q = Shop.ransack(params[:q])
      @shops = @q.result(distinct: true).page(params[:page])
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
