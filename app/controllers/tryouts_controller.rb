class TryoutsController < ApplicationController
  
  def show
    # render component: 'Quiz', props: { quiz_id: params[:quizz_id], token: params[:token] }
  end

  def create
    question = Question.find(params[:student_answer][:question_id])
    if question.answer == params[:student_answer][:answer] 
      result = true
    elsif question.answer.to_i.humanize == params[:student_answer][:answer]
      result = true
    else 
      result = false
    end
    @tryout = StudentAnswer.new(tryout_params.merge({:is_right => result, :student_id => session[:user_id]}))
    if @tryout.save
      if question.next.present?
        redirect_to tryout_path(:quizz_id => 10, :question_id => question.next) 
      else 
        redirect_to root_path
      end
    else
      Rails.logger.info(@tryout.errors.inspect)
      redirect_to root_path
    end
  end

  private

  def tryout_params
    params.require(:student_answer).permit(:id, :student_id, :question_id, :answer, :is_right)
  end

  def integer?(str)
    !!Integer(str) rescue false
  end

end
