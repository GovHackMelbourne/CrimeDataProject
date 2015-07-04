require 'rails/all'
require 'csv'

namespace :import do

	desc "import crime_stats_now from csv"
	task nowdata: :environment do
		filename = File.join Rails.root, "NOWdata.csv"
		counter = 0

		CSV.foreach(filename, :headers => true, :col_sep => "|") do |row| 
			crime_datum = CrimeDatum.create(category: row["Category"], local_authority: row["LocalAuthority"], time: row["Time"], season: row["Season"], light: row["Light"])
			puts "#{id} - #{crime_datum.errors.full_messages.join(",")}" if crime_datum.errors.any?
			counter += 1 if crime_datum.persisted?
		end
		puts "Imported #{counter}"
	end

	desc "import questions_data from csv"
	task questiondata: :environment do
		filename = File.join Rails.root, "QUESTIONSdata.csv"
		counter = 0

		CSV.foreach(filename, :headers => true, :col_sep => "|") do |row| 
			quiz = Quiz.create(category: row["Category"], question: row["Question"], answer_1: row["Answer1"], answer_2: row["Answer2"], answer_3: row["Answer3"], answer_4: row["Answer4"], solution: row["Solution"], correct: row["Correct"], incorrect: row["Incorrect"])
			puts "#{id} - #{quiz.errors.full_messages.join(",")}" if quiz.errors.any?
			counter += 1 if quiz.persisted?
		end
		puts "Imported #{counter}"
	end
end