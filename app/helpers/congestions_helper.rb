module CongestionsHelper
  def get_congestion(shop_id)
    status = Congestion.where(shop_id: shop_id).within_1_hour.group(:status).order(count_all: :desc).count.first.to_a[0]
    return Congestion.find_by(status: status)
  end

  def get_vacant_shops
    Shop.where(id: Congestion.where(status: 0).within_1_hour.select(:shop_id))
  end
end
