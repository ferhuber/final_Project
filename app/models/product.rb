class Product < ApplicationRecord

  include PgSearch
  pg_search_scope :search_by_title, :against => :title

  mount_uploader :image, ImageUploader

  has_many :flavours
  has_many :amounts, through: :flavours
  has_many :types


end
