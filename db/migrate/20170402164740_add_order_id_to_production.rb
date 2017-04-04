class AddOrderIdToProduction < ActiveRecord::Migration[5.0]
  def change
    add_reference :productions, :order, foreign_key: true
  end
end
