class Ingredient < ApplicationRecord

  include PgSearch
  has_many :amounts
  multisearchable :against => [:ingredient]
end
