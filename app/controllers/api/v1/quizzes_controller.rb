class Api::V1:: QuizzesController < ApplicationController
  respond_to :json

  def index
    quiz =  Quizz.all
    render json: quiz
  end

  def show
    quiz = StudentAnswer.joins(:question, :student).where(:student_id => params[:id], :answer => nil).where("students.token = ?", params[:token]).select("question_content, student_answers.id")
    # If quiz already finished (no more questions)
    if quiz.empty?
      quiz = {:status => 'finished'}
      render :json => quiz
    else
    # if quiz has remaining questions
    render json: quiz
    end
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
    elsif kanji_hiragana(answer, params[:quiz][:answer])
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

  # Compared first and second params
  # If second params is hiragana of first params, it will return true, UTF-8 encoding only
  def kanji_hiragana(kanji, hiragana)
    # 7 is Yomi (hiraganaaあ)
    temp = Natto::MeCab.new('-F%f[7]')
    result = []
    temp.parse(kanji) do |n|
    # 2 is kanji
      if n.char_type==2
        yomi = n.feature
        result << NKF.nkf('-h1 -w', yomi)
      else
        result << n.surface
      end
    end
    result.join
    # Example : 雪 -> ゆき = true , 横浜 -> よこはま = true
    return true if result[0] == hiragana
  end
end