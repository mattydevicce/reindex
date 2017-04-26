class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :service_id
      t.integer :route_id
      t.integer :trip_id
      t.string :trip_headsign
      t.string :trip_short_name
      t.integer :direction_id
      t.integer :shape_id

      t.timestamps
    end
  end
end
