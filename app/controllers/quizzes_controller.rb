class QuizzesController < ApplicationController
 def index
    @quiz = Quizz.all
  end

  def show
    @quiz = Question.where(:quiz_id => params[:id])
  end

  def new 
    @quiz ||= Quizz.new
  end

  def create
    @quiz = Quizz.new(quiz_params.merge({ :created_by => session[:user_id] }))
    if @quiz.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def quiz_params
    params.require(:quizz).permit(:id, :created_by, :quiz_name)
  end
end
