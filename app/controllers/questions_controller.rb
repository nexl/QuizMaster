class QuestionsController < ApplicationController
  
  before_action :require_login
  before_action :is_owner?, :only => [:edit]

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
    params.require(:question).permit(:id, :quizz_id, :question_content, :answer)
  end

  # Check if the current user is owner of this question ?
  def is_owner?
    question = Question.find(params[:id])
    redirect_to root_path if question.quizz.created_by != current_user.id
  end
end
