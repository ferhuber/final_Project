class Event < ApplicationRecord

  has_many :Orders

   validates :type_of, presence: true
   validates :number_people, presence: true
   validates :event_date, presence: true
   validates :delivery_date, presence: true
end
