class Product < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :productions
  has_many :flavours_of_products
  has_many :types_of_products

  has_many :types, through: :types_of_products
  has_many :flavours, through: :flavours_of_products



  # has_many :amounts, through: :flavours
  # has_many :orders, through: :products


end
