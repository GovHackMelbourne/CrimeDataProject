module CrimesHelper

	def time_helper(time)
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

   def risk_rating_helper(risk)
      case risk
      when "Red"
        "danger"
      when "Amber"
        "warning"
      when "Green"
        "success"
      end
    end

end
