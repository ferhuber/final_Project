class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :flavours
  has_many :types


end
