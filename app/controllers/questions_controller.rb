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

  def edit 
    @question ||= Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to quiz_path(@question.quizz_id)
    else
      redirect_to root_path
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to quiz_path(@question.quizz_id)
    else
      redirect_to root_path
    end
  end

  def destroy
    question = Question.find(params[:id])
    quiz = question.quizz_id
    question.destroy
    redirect_to quiz_path(quiz)
  end

  private

  def question_params
    params.require(:question).permit(:id, :quizz_id, :question, :answer)
  end
end
