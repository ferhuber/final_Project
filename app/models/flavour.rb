class Flavour < ApplicationRecord

  has_many :flavours_of_products
  has_many :products, through: :flavours_of_products
  has_many :amounts
  has_many :ingredients, through: :amounts

end
