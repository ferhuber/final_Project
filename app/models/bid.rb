class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user

  scope :latest_first, -> {order("created_at DESC")}

end
