class Api::V1:: QuizzesController < ApplicationController
  respond_to :json

  def index
    quiz =  Quizz.all
    render json: quiz
  end

  def show
    quiz = Question.where(:quizz_id => params[:id]).select("id, quizz_id, question")
    render json: quiz
  end

  def create
    question = Question.find(params[:quiz][:question_id])
    if question.answer.downcase == params[:quiz][:answer].downcase
      result = true
    # Humanize numbers, like 6 -> six
    elsif question.answer.to_i.humanize == params[:quiz][:answer].downcase
      result = true 
    else  #Answer is false
      result = false
    end
    # Create answer on db
    @tryout = StudentAnswer.create(item_params  .merge({:is_right => result, :student_id => session[:user_id]}))
  end

  private
  def item_params
    params.require(:quiz).permit(:id, :student_id, :question_id, :answer, :is_right) 
  end
end