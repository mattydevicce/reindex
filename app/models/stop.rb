class Stop < ApplicationRecord
	self.primary_key = 'stop_id'
	belongs_to :stop_times
end
