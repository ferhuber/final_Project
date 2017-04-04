class Flavour < ApplicationRecord

  has_many :products
  has_many :amounts
  has_many :ingredients, through: :amounts

end
