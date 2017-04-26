class CreateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies do |t|
      t.string :agency_name
      t.string :agency_url
      t.string :agency_timezone
      t.string :agency_lang
      t.string :agency_phone
      t.integer :agency_id

      t.timestamps
    end
  end
end
