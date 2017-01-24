class Api::V1:: QuizzesController < ApplicationController
  respond_to :json

  def index
    quiz =  Quizz.all
    render json: quiz
  end

  def show
    # Validate student id and token
    student = Student.student_data(params[:id], params[:token])
    # If token and id are not exist in db
    if student.empty?
      quiz = {:status => 'not_found'}
      render :json => quiz
    else
      # Quiz mode
      quiz = StudentAnswer.remaining_question(params[:id], params[:token])
      # If quiz already finished (no more questions)
      if quiz.empty?
        quiz = {:status => 'finished'}
        render :json => quiz
      else
      # if quiz has remaining questions
      render json: quiz
      end
    end
  end

  # Answer quiz [question]
  def update 
    question = StudentAnswer.find(params[:quiz][:question_id])
    question.answer = params[:quiz][:answer]
    answer = question.question.answer
    if answer.downcase == params[:quiz][:answer].downcase
      question.is_right = true
    # Humanize numbers, like 6 -> six, 21 -> twenty-one, twenty one
    elsif humanize(answer.to_i.humanize, params[:quiz][:answer].downcase)
      question.is_right = true
    elsif humanize_string(answer.downcase, params[:quiz][:answer].downcase)
      question.is_right = true 
    else
      # Check if answer is Japanese  
      if is_japanese?(answer) == true
        question.is_right = kanji_hiragana(answer, params[:quiz][:answer]) ? true : false
      else #if the answer is not Japanese, return false
      question.is_right = false
      end
    end

    if question.save
      #puts j
    else
      Rails.logger.info(question.errors.inspect)
    end
  end

  # Quiz result
  def result
    result = StudentAnswer.get_result(params[:id])
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

  #Number to words
  def humanize(answer, param)
    if answer == param
      true
    # Treat - as space, ex: twenty-one and twenty one  
    elsif answer.sub('-', ' ') == param
      true
    else
      false
    end
  end

  def humanize_string(answer, param)
    temp = answer.split
    temp.map!{ | idx |
      idx = is_i?(idx) ? idx.to_i.humanize.sub('-', ' ') : idx
    }
    new_answer = temp.join(' ') ? true : false
   end

  def is_japanese?(input)
    (input =~ /\p{Han}|\p{Katakana}|\p{Hiragana}/) ? true : false
  end

  def is_i?(input)
    (input =~ /\A[-+]?[0-9]+\z/) ? true : false
  end

end