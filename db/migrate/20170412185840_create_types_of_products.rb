class CreateTypesOfProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :types_of_products do |t|

      t.timestamps
    end
  end
end
