class AddFlavourIdToFlavoursOfProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :flavours_of_products, :flavour, foreign_key: true
  end
end
