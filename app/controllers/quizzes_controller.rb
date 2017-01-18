class QuizzesController < ApplicationController
 def index
    @quiz = Quizz.all
  end

  def show
    @quiz = Question.where(:quizz_id => params[:id])
    @participants = StudentAnswer.joins(:question).where('questions.quizz_id = ?', params[:id])
    @participants = @participants.group_by { | user | user.student.full_name }
  end

  def new 
    @quiz ||= Quizz.new
    # Set 1 default question for each quiz
    @quiz.question.build
  end

  def create
    @quiz = Quizz.new(quiz_params.merge({ :created_by => session[:user_id] }))
    if @quiz.save
      redirect_to quiz_path(@quiz)
    else
      Rails.logger.info(@quiz.errors.inspect)
      redirect_to root_path
    end
  end

  private

  def quiz_params
    params.require(:quizz).permit(:id, :created_by, :quiz_name, 
      :question_attributes => [:id, :quizz_id, :question, :answer, :_destroy])
  end
end
