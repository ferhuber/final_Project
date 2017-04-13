class AddProductIdToTypesOfProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :types_of_products, :product, foreign_key: true
  end
end
