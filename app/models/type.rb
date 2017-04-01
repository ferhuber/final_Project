class Type < ApplicationRecord
  include PgSearch
  belongs_to :product
  multisearchable :against => [:type_of]
end
