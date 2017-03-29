class Amount < ApplicationRecord
  has_many :ingredients
  has_many :flavours
end
