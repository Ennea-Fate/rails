class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date, null: false
      t.time :time, null: false
      t.text :from_adress, null: false, length: 512
      t.text :to_adress, null: false, length: 512
      t.integer :passangers_count, null: false
      t.string :lenght_of_the_route, null: false
      t.references :driver, index: true, foreign_key: true, null: false
      t.references :rate, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
