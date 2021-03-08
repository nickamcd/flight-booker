class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references  :from_airport, foreign_key: { to_table: :airports }
      t.references  :to_airport,   foreign_key: { to_table: :airports }
      t.integer     :duration
      t.datetime    :takeoff_datetime

      t.timestamps
    end
  end
end
