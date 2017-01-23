class QuizzesController < ApplicationController

  before_action :require_login
  before_action :is_owner?, :only => [:show]
  
  def index
    @quiz = Quizz.where(:created_by => current_user.id)
  end

  def show
    @list_question = Question.where(:quizz_id => params[:id])
    @quiz = Quizz.find(params[:id])
    @participants = StudentAnswer.participant(params[:id])
    @participants = @participants.group_by { | user | user.student }
  end

  def new 
    @quiz ||= Quizz.new
    # Set 1 default question for each quiz
    @quiz.question.build
  end

  def create
    @quiz = Quizz.new(quiz_params.merge({ :created_by => current_user.id}))
    if @quiz.save
      flash[:success] = "Quiz [#{@quiz.quiz_name}] has been successfully created"
      redirect_to quiz_path(@quiz)
    else
      Rails.logger.info(@quiz.errors.inspect)
      redirect_to root_path
    end
  end

  private

  def quiz_params
    params.require(:quizz).permit(:id, :created_by, :quiz_name, 
      :question_attributes => [:id, :quizz_id, :question_content, :answer, :_destroy])
  end

  # Check if the current user is owner of this quiz ?
  def is_owner?
    quiz = Quizz.find(params[:id])
    redirect_to root_path if quiz.created_by != current_user.id
  end

end
