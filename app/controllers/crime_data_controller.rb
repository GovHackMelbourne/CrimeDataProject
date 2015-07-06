class CrimeDataController < ApplicationController

  include CrimesHelper

  def index
    cookies[:path] = {
      :value => params[:selection],
      :expires => 1.year.from_now
    }
    now = DateTime.now.utc
    time = now.in_time_zone('Brisbane')
    hour = time.hour
    month = time.month

    puts "***********"
    p cookies[:location]
    puts "***********"

    puts "SSSSSSSSSSSSSSSSSSSS"
    p season_helper(month)
    p month
    puts "SSSSSSSSSSSSSSSSSSSS"

    puts "TTTTTTTTTTTTTTTTTTTT"
    p time_helper(hour)
    p hour
    puts "TTTTTTTTTTTTTTTTTTTT"

    record = CrimeDatum.where(category: cookies[:path], local_authority: cookies[:location], season: season_helper(month), time: time_helper(hour)).first
    colour = record.light

    @risk_colour = risk_rating_helper(colour)[:rating]
    @risk_sentence = risk_rating_helper(colour)[:sentence]

    puts "CCCCCCCCCCCCCCCCC"
    p @risk_colour
    puts "CCCCCCCCCCCCCCCCC"

    puts "RRRRRRRRRRRRRRRRR"
    p @risk_sentence
    puts "RRRRRRRRRRRRRRRRR"

  end

  def show
  	

  end

  def data

  end

end
