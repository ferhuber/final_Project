class AddProductIdToType < ActiveRecord::Migration[5.0]
  def change
    add_reference :types, :product, foreign_key: true
  end
end
