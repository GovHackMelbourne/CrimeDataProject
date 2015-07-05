class HomeController < ApplicationController
  def index
		cookies[:location] = {
			:value => 'Melbourne',
			:expires => 1.year.from_now
	  }
    
  end

  def options

  end

  def paths

  end
end