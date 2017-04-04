class AddLngLatToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :longitude, :float
    add_column :customers, :latitude, :float
  end
end
