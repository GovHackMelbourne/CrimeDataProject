class QuizzesController < ApplicationController
  
	def index
    @testing = Quiz.where(category: 'Foot')
  end

  def show
    
  end
  
end
