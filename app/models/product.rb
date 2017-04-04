class Product < ApplicationRecord


  mount_uploader :image, ImageUploader

  has_many :productions
  has_many :types
  has_many :flavours
  has_many :amounts, through: :flavours
  has_many :orders, through: :products


end
