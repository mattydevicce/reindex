class Trip < ApplicationRecord
	belongs_to :stop_times
	belongs_to :calendar_dates
	belongs_to :routes
end
