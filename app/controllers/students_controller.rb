class StudentsController < ApplicationController
  def index
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      total_question = Question.where(:quizz_id => params[:student][:token])
      total_question.each do | question |
        StudentAnswer.create({:student_id => @student.id, :question_id => question.id})
      end
      redirect_to new_student_path
    else
      redirect_to new_student_path
    end
  end

  private
  def student_params
    params.require(:student).permit(:id, :full_name, :token)
  end
end
