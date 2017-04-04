class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :type_of
      t.integer :number_people
      t.date :event_date
      t.date :delivery_date

      t.timestamps
    end
  end
end
