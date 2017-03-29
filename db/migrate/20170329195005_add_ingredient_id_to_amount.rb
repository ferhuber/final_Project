class AddIngredientIdToAmount < ActiveRecord::Migration[5.0]
  def change
      add_reference :amounts, :ingredient, foreign_key: true
    end
end
