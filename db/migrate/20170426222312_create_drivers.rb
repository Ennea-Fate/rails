class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :fn, null: false
      t.string :sn, null: false
      t.string :ln, null: false
      t.date :birthdate, null: false
      t.string :TIN, null: false, limit: 10
      t.string :passport, null: false, limit: 10
			t.references :auto, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
