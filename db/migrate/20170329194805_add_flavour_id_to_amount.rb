class AddFlavourIdToAmount < ActiveRecord::Migration[5.0]
  def change
    add_reference :amounts, :flavour, foreign_key: true
  end
end
