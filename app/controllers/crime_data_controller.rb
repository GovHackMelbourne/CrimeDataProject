class CrimeDataController < ApplicationController

	def index
		cookies[:path] = {
			:value => params[:selection],
			:expires => 1.year.from_now
	  }
  end

  def show
    
  end

  def data
  	
  end
  
end
