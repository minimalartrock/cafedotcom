# frozen_string_literal: true

class SearchController < ApplicationController
  def location
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @q = Shop.within_box(0.310686, latitude, longitude)
    @shops = @q.page(params[:page])
    render 'result'
  end

  def outret
    @q = Shop.where(outret: true)
    @shops = @q.page(params[:page])
    render 'result'
  end

  def wifi
    @q = Shop.where(wifi: true)
    @shops = @q.page(params[:page])
    render 'result'
  end

  def smoking
    @q = Shop.where(smoking: true)
    @shops = @q.page(params[:page])
    render 'result'
  end
end
