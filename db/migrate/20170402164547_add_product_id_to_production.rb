class AddProductIdToProduction < ActiveRecord::Migration[5.0]
  def change
    add_reference :productions, :product, foreign_key: true
  end
end
