class QuizzesController < ApplicationController
 def index
    @quiz = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new 
    @quiz ||= Quiz.new
  end

  def create
    quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:id, :created_by, :quiz_name)
  end
end
