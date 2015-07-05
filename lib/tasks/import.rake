require 'rails/all'
require 'csv'

namespace :import do

	desc "import crime_stats_now from csv"
	task now_data: :environment do
		filename = File.join Rails.root, "now_data.csv"
		counter = 0

		CSV.foreach(filename, :headers => true, :col_sep => "|") do |row| 
			crime_datum = CrimeDatum.create(category: row["Category"], local_authority: row["LocalAuthority"], time: row["Time"], season: row["Season"], light: row["Light"], tip1: row["Tip1"], tip2: row["Tip2"], tip3: row["Tip3"], tip4: row["Tip4"])
			puts "#{id} - #{crime_datum.errors.full_messages.join(",")}" if crime_datum.errors.any?
			counter += 1 if crime_datum.persisted?
		end
		puts "Imported #{counter}"
	end

	desc "import questions_data from csv"
	task question_data: :environment do
		filename = File.join Rails.root, "questions_data.csv"
		counter = 0

		CSV.foreach(filename, :headers => true, :col_sep => "|") do |row| 
			quiz = Quiz.create(category: row["Category"], question: row["Question"], answer_1: row["Answer1"], answer_2: row["Answer2"], answer_3: row["Answer3"], answer_4: row["Answer4"], solution: row["Solution"], correct: row["Correct"], incorrect: row["Incorrect"], chart: row["Chart"])
			puts "#{id} - #{quiz.errors.full_messages.join(",")}" if quiz.errors.any?
			counter += 1 if quiz.persisted?
		end
		puts "Imported #{counter}"
	end

	desc "import postcode_lga_lookup data from csv"
	task postcode_lga_lookup: :environment do
		filename = File.join Rails.root, "postcode_lga_lookup.csv"
		counter = 0

		CSV.foreach(filename, :headers => true, :col_sep => "|") do |row| 
			lookup = PostcodeLgaLookup.create(postcode: row["Postcode"], lga: row["LGA"])
			puts "#{id} - #{lookup.errors.full_messages.join(",")}" if lookup.errors.any?
			counter += 1 if lookup.persisted?
		end
		puts "Imported #{counter}"
	end

	desc "import police_map_data from csv"
	task police_map_data: :environment do
		filename = File.join Rails.root, "police_map_data.csv"
		counter = 0

		CSV.foreach(filename, :headers => true, :col_sep => "|") do |row| 
			police_map_datum = PoliceMapDatum.create(category: row["Category"], name: row["Name"], latitude: row["Latitude"], longitude: row["Longitude"], address: row["Address"], phone: row["Phone"])
			puts "#{id} - #{police_map_datum.errors.full_messages.join(",")}" if police_map_datum.errors.any?
			counter += 1 if police_map_datum.persisted?
		end
		puts "Imported #{counter}"
	end
end