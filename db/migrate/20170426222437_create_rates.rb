class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :name, null: false
      t.string :times_of_day, null: false
      t.string :how_far, null: false
      t.integer :PPK, null: false

      t.timestamps null: false
    end
		reversible do |dir|
			dir.up do
				execute("ALTER TABLE rates ADD CONSTRAINT tod_chk CHECK(times_of_day = ANY(ARRAY['день', 'ночь']))")
				execute("ALTER TABLE rates ADD CONSTRAINT howfar_chk CHECK(how_far = ANY(ARRAY['В пределах МКАД', 'За МКАД', 'Подмосковье']))")
			end
			dir.down do
				execute("ALTER TABLE rates DROP CONSTRAINT tod_chk")
				execute("ALTER TABLE rates DROP CONSTRAINT howfar_chk")
			end
		end
  end
end
