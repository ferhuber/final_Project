class ProductTypeFlavour < ApplicationRecord
  has_many :types
  has_many :flavours
  has_many :products
end
