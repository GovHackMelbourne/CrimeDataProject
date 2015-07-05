class QuizzesController < ApplicationController
  
	def index
    @quizzes = Quiz.where(category: cookies[:path])
  end

  def show
    
  end
  
end
