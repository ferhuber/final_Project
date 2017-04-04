class AddEndDateToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :end_date, :datetime
  end
end
