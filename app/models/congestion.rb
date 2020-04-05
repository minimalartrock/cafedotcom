class Congestion < ApplicationRecord
  enum status: { vacant: 0, usually: 1, crowded: 2 }
  belongs_to :user
  belongs_to :shop
end
