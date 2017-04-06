class Location < ApplicationRecord
  belongs_to :customer

  geocoded_by :ip_address
  after_validation :geocode

  validates :customer_id, presence: true
end
