class Order < ApplicationRecord
  has_many :productions
  has_many :products, through: :productions
  belongs_to :customer
  belongs_to :event

validates :store, presence: true

end
