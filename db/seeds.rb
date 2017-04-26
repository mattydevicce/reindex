# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# agency = File.read(Rails.root.join('lib', 'seeds', 'agency.txt'))
require 'csv'

folder = Dir['lib/seeds/*']
puts FeedInfo.create()
folder.each do |file|
	csv_text = File.read(file)
	csv = CSV.parse(csv_text, :headers => true)
	className = file.split('/')[-1].split('.')[0].split('_').map(&:singularize).map(&:capitalize).join().constantize
	puts className
	csv.each do |row|
		className.create(row.to_hash)
	end
end