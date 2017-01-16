class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new 
    @question ||= Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:id, :quiz_id, :question, :answer)
  end
end