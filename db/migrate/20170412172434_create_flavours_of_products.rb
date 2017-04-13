class CreateFlavoursOfProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :flavours_of_products do |t|

      t.timestamps
    end
  end
end
