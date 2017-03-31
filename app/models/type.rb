class Type < ApplicationRecord
  include PgSearch
  belongs_to :products
  multisearchable :against => [:type_of]
end
