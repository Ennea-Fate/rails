class CreateJoinTableAutosDrivers < ActiveRecord::Migration
  def change
    create_join_table :autos, :drivers do |t|
      t.index :auto_id
      t.index :driver_id
    end
  end
end
