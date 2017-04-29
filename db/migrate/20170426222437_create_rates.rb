class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :name, null: false
      t.string :times_of_day, null: false
      t.string :how_far, null: false
      t.integer :PPK, null: false

      t.timestamps null: false
    end
  end
end
