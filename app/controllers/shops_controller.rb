# frozen_string_literal: true

class ShopsController < ApplicationController
  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).page(params[:page])
    @recently_commented_shops = view_context.recently_commented_shops
  end

  def show
    @shop = Shop.find(params[:id])
    @comments = @shop.comments.order(created_at: :desc).page(params[:page]).per(5)
  end
end
