module CrimesHelper

  def set_path_cookie
    if params[:selection].present?
      cookies[:path] = {
        :value => params[:selection],
        :expires => 1.year.from_now
      }
    end
  end

  def time_helper
    now = DateTime.now.utc
    time = now.in_time_zone('Brisbane')
  end

  def daytime_helper(time)
    return "Morning" if time < 12
    return "Afternoon" if time < 16
    return "Evening" if time < 19
    "Night"
  end

  def season_helper(month)
    case month
    when 3...6
      "Autumn"
    when 6...9
      "Winter"
    when 9...12
      "Spring"
    else
      "Summer"
    end
  end

  def risk_rating_helper(colour)
    case colour
    when "Red"
      {rating: "danger", sentence: "Be Very Vigilant!"}
    when "Amber"
      {rating: "warning", sentence: "Be Cautious!"}
    when "Green"
      {rating: "success", sentence: "Low risk, stay safe!"}
    end
  end

end
