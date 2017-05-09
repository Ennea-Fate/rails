class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.string :model, null: false, limit: 64
      t.string :myclass, null: false
      t.string :number, null: false, limit: 9
      t.string :color, null: false
      t.string :year, null: false, limit: 4 

      t.timestamps null: false
    end
		reversible do |dir|
			dir.up do
				execute("ALTER TABLE autos ADD CONSTRAINT class_chk CHECK(myclass = ANY(ARRAY['бизнес', 'эконом']))")
			end
			dir.down do
				execute("ALTER TABLE people DROP CONSTRAINT class_chk")
			end
		end
  end
end
