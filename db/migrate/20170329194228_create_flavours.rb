class CreateFlavours < ActiveRecord::Migration[5.0]
  def change
    create_table :flavours do |t|
      t.string :flavour

      t.timestamps
    end
  end
end
