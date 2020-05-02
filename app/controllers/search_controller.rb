# frozen_string_literal: true

class SearchController < ApplicationController
  def prefecture
    @q = Shop.where(pref_code: 'PREF13')
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
