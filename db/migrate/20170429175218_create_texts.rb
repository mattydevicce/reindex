class CreateTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :texts do |t|
      t.string :original
      t.string :command
      t.string :translated

      t.timestamps
    end
  end
end
