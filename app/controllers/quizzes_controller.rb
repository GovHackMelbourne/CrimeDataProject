class QuizzesController < ApplicationController
  
	def index
    @quizzes = Quiz.where(category: 'Foot')
  end

  def show
    
  end
  
end
