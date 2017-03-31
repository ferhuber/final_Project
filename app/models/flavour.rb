class Flavour < ApplicationRecord

  belongs_to :product
  has_many :amounts
  has_many :ingredients, through: :amounts

end
