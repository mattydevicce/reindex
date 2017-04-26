class CreateStopTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :stop_times do |t|
      t.string :trip_id
      t.time :arrival_time
      t.time :departure_time
      t.integer :stop_id
      t.string :stop_sequence

      t.timestamps
    end
  end
end
