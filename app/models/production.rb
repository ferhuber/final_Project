class Production < ApplicationRecord
  belongs_to :product
  belongs_to :order
  has_many :events, through: :orders
end
