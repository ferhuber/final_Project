class AddRememberDigestToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :remember_digest, :string
  end
end
