class Ingredient < ApplicationRecord
  has_many :amounts

  include PgSearch
  multisearchable :against => [:ingredient]
end
