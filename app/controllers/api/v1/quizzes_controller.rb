class Api::V1:: QuizzesController < ApplicationController
  respond_to :json

  def index
    quiz =  Quizz.all
    render json: quiz
  end

  def show
    quiz = StudentAnswer.joins(:question, :student).where(:student_id => params[:id], :answer => nil).where("students.token = ?", params[:token]).select("question_content, student_answers.id")
    render json: quiz
  end

  def update 
    question = StudentAnswer.find(params[:quiz][:question_id])
    question.answer = params[:quiz][:answer]
    answer = question.question.answer
    if answer.downcase == params[:quiz][:answer].downcase
      question.is_right = true
    # Humanize numbers, like 6 -> six
    elsif answer.to_i.humanize == params[:quiz][:answer].downcase
      question.is_right = true 
    else  #Answer is false
      question.is_right = false
    end
    if question.save
      #puts abcd
    else
      Rails.logger.info(question.errors.inspect)
    end
  end

  # Quiz result
  def result
    result = StudentAnswer.joins(:question).where(:student_id => params[:id]).select("question_content, is_right, student_answers.id")
    render json: result
  end

  # List quiz participants
  def participant
    quiz = Student.where(:quizz_id => params[:id])
    render json: quiz
  end

  private
  def item_params
    params.require(:quiz).permit(:id, :student_id, :question_id, :answer, :is_right) 
  end
end