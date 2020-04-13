class Congestion < ApplicationRecord
  enum status: { vacant: 0, usually: 1, crowded: 2 }
  belongs_to :user
  belongs_to :shop
  # スタータス別投稿数をサマリする
  scope :status_count, ->(shop_id, status) { where(shop_id: shop_id, status: status).count }
  # 1時間前のレコードを取得する
  scope :within_hour, ->(from = Time.current.ago(1.hour), to = Time.current) { where(created_at: from..to) }
  # 当該ユーザが1時間以内に投稿したレコード数を取得する
  scope :already_posted, ->(user_id) { where(user_id: user_id).within_hour.count }
  # ステータスの集計
  scope :summary_status, ->(shop_id) { where(shop_id: shop_id).group(:status).order('count_all': :desc).count.first }
end
