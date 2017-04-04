class AddAuctionsIdToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :auction_id, :integer
    add_foreign_key  :bids, :auctions
  end
end
