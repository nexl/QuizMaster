class QuestionsController < ApplicationController
  
  before_action :require_login
  before_action :is_owner?, :only => [:edit]

  def new 
    @question ||= Question.new
    @has_quiz = Quizz.where(:created_by => current_user.id)
  end

  def edit 
    @question ||= Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = "Question [#{@question.question_content}] has been updated succesfully"
      redirect_to quiz_path(@question.quizz_id)
    else
      redirect_to root_path
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question [#{@question.question_content}] was added to [#{@question.quizz.quiz_name}]"
      redirect_to quiz_path(@question.quizz_id)
    else
      redirect_to root_path
    end
  end

  def destroy
    question = Question.find(params[:id])
    quiz = question.quizz_id
    question.destroy
    flash[:success] = "Question [#{question.question_content}] has been deleted succesfully from Quiz[#{question.quizz.quiz_name}]"
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
