class AddCustomerIdToLocations < ActiveRecord::Migration[5.0]
    def change
    add_reference :locations, :customer, foreign_key: true
  end
end
