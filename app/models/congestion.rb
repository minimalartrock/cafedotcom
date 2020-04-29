class Congestion < ApplicationRecord
  enum status: { vacant: 0, usually: 1, crowded: 2 }
  belongs_to :comment
  belongs_to :shop
  validates :status, presence: true

  scope :within_1_hour, -> { where(created_at: Time.current.ago(1.hour)..Time.current) }
end
