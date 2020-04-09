module CongestionsHelper
  def get_congestion_status(shop_id)
    @summary_status = Congestion.within_hour.summary_status(shop_id)
    return @summary_status[0]
  end
end
