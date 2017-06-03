class RemoveTexts < ActiveRecord::Migration[5.0]
  def change
  	change_table :texts do |t|
  		t.rename :primary, :original
  		t.rename :foreign, :translated
  	end
  end
end
