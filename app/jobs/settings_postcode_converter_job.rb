require 'construct'

class SettingsPostcodeConverterJob < ActiveJob::Base

	def perform
		# Produce output.yaml file
	  File.open('./config/settings.yml', 'w+') do |file|
	  	configuration = Construct.new
	  	configuration['postcode'] = {}
	  	configuration['postcode']['3000'] = "Melbourne"
	  	configuration['postcode']['3001'] = "postcode_converter"
	    file.puts configuration.to_yaml
	  end

	end

end