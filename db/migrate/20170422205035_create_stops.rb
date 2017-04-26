class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table :stops do |t|
      t.integer :stop_id
      t.string :stop_name
      t.decimal :stop_lat
      t.decimal :stop_lon

      t.timestamps
    end
  end
end
