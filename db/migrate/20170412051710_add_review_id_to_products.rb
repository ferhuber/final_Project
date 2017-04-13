class AddReviewIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :review, foreign_key: true
  end
end
