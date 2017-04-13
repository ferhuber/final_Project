class AddCustomerIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :customer, foreign_key: true
  end
end
