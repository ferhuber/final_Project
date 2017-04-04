class AddProductionIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :production, foreign_key: true
  end
end
