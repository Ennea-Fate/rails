class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :fn, null: false
      t.string :sn, null: false
      t.string :ln, null: false
      t.date :birthdate, null: false
      t.integer :TIN, null: false, lenght: 10
      t.integer :passport, null: false, lenght: 8

      t.timestamps null: false
    end
  end
end
