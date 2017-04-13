class Type < ApplicationRecord
  has_many :types_of_products
  has_many :products, through: :types_of_products
end
