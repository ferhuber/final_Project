class Type < ApplicationRecord
  include PgSearch
  multisearchable :against => [:type_of]
end
