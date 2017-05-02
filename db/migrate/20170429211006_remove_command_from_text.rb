class RemoveCommandFromText < ActiveRecord::Migration[5.0]
  def change
  	change_table :texts do |t|
  		t.remove :command
  	end
  end
end
