class Api::V1:: StudentsController < ApplicationController
  respond_to :json

  def index
    quiz = Student.where(:quizz => 10)
    render json: quiz
  end

  def create
    @student = Student.new(student_params.merge({:quizz_id => params[:student][:quiz_id]}))
    if @student.save
      total_question = Question.where(:quizz_id => params[:student][:quiz_id])
      total_question.each do | question |
        StudentAnswer.create({:student_id => @student.id, :question_id => question.id})
      end
      render json: @student
    else
      Rails.logger.info(question.errors.inspect)
    end
  end

  private
  def student_params
    params.require(:student).permit(:id, :full_name, :token) 
  end
end