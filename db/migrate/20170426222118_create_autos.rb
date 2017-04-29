class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.string :model, null: false, limit: 64
      t.string :myclass, null: false
      t.string :number, null: false, limit: 6
      t.string :color, null: false
      t.string :year, null: false, limit: 4 

      t.timestamps null: false
    end
  end
end
