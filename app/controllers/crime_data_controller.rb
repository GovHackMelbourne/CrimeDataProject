class CrimeDataController < ApplicationController

  include CrimesHelper

  def index
    set_path_cookie

    @colour = CrimeDatum.where(
      category: cookies[:path],
      local_authority: cookies[:location],
      season: season_helper(time_helper.month),
      time: daytime_helper(time_helper.hour)
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
