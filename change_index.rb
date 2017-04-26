folder = Dir['lib/seeds/*']
stops = folder[6]
stop_times = folder[5]
puts File.readlines(stop_times)[1]
index = 0

File.readlines(stops).each do |l|

	if index == 0
		puts 'increasing index by 1'
		index += 1
	elsif index == l.split(',')[0].gsub!('"','').to_i
		puts 'match'
		index += 1
	else
		line_number = l.split(',')[0]
		puts line_number
		File.readlines(stop_times).each do |stop_time|
			if stop_time.split(',')[3] == line_number
				puts 'found a match'
				stop_time.split(',')[3] = index
			end
		end
		line_number = index
		# puts l.split(',')[0].gsub!('"', '').to_i
		index += 1
	end  
end