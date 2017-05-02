class ChangeTextsColumnNames < ActiveRecord::Migration[5.0]
  def change
  	change_table :texts do |t|
  		t.rename :original, :primary
  		t.rename :translated, :foreign
  	end
  end
end
