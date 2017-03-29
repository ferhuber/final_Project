class CreateAmounts < ActiveRecord::Migration[5.0]
  def change
    create_table :amounts do |t|
      t.string :unit
      t.integer :quantity

      t.timestamps
    end
  end
end
