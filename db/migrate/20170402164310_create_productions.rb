class CreateProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :productions do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
