class CrimeDataController < ApplicationController

  include CrimesHelper

  def index
    if params[:selection].present?
      cookies[:path] = {
        :value => params[:selection],
        :expires => 1.year.from_now
      }
    end

    month = time_helper.month
    hour = time_helper.hour

    @colour = CrimeDatum.where(
      category: cookies[:path],
      local_authority: cookies[:location],
      season: season_helper(month),
      time: daytime_helper(hour)
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
