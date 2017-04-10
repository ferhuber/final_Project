class CreateLocations < ActiveRecord::Migration[5.0]
    def change
    create_table :locations do |t|
      t.float :longitude
      t.float :latitude
      t.string :ip_address

      t.timestamps
    end
  end
end