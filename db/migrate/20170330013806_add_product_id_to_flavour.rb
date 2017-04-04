class AddProductIdToFlavour < ActiveRecord::Migration[5.0]
  def change
    add_reference :flavours, :product, foreign_key: true
  end
end
