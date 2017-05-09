class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :fn, null: false
      t.string :sn, null: false
      t.string :ln, null: false
      t.date :birthdate, null: false
      t.integer :TIN, null: false
      t.integer :passport, null: false
			t.references :auto, index: true, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
