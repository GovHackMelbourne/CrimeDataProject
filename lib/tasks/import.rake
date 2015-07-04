require 'csv'

namespace :import do

	desc "import crime_stats_now from csv"
	task nowdata: :environment do
		filename = File.join Rails.root, "NOWdata.csv"
		CSV.foreach(filename) do |row|
			p row
		end
	end
end