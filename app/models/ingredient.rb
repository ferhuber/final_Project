class Ingredient < ApplicationRecord

  include PgSearch
  has_many :amount
  multisearchable :against => [:ingredient]
end
