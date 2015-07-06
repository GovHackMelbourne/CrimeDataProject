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

    @colour = CrimeDatum.where(
      category: cookies[:path], 
      local_authority: cookies[:location], 
      season: season_helper(month), 
      time: time_helper(hour)
      ).first.light

    @risk_rating = risk_rating_helper(@colour)[:rating]
    @risk_sentence = risk_rating_helper(@colour)[:sentence]

  end

  def show
    @colour = params[:colour]
    @risk_rating = risk_rating_helper(@colour)[:rating]
    @risk_sentence = risk_rating_helper(@colour)[:sentence]

    @crime_datum = CrimeDatum.where(
      category: cookies[:path], 
      local_authority: cookies[:location], 
      light: @colour
      ).first
  end

  def data

  end

end
