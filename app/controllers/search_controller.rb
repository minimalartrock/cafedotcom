# frozen_string_literal: true

class SearchController < ApplicationController
  include CongestionsHelper

  def location
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @q = Shop.within_box(0.310686, latitude, longitude)
    @shops = @q.page(params[:page])
    render "result"
  end
end
