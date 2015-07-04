require 'rails/all'
# require '../app/models/crime_datum'
require 'csv'

namespace :import do

	desc "import crime_stats_now from csv"
	task nowdata: :environment do
		filename = File.join Rails.root, "NOWdata.csv"
		counter = 0

		CSV.foreach(filename, :headers => true, :col_sep => "|") do |row| 
			crime_datum = CrimeDatum.create(category: row["Category"], local_authority: row["LocalAuthority"], time: row["Time"], season: row["Season"], light: row["Light"])
			puts "#{local_authority} #{time} - #{crime_datum.errors.full_messages.join(",")}" if crime_datum.errors.any?
			counter += 1 if crime_datum.persisted?
		end
		puts "Imported #{counter}"
	end
end