class AddAmountIdToFlavour < ActiveRecord::Migration[5.0]
  def change
    add_reference :flavours, :amount, foreign_key: true
  end
end
