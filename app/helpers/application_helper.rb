module ApplicationHelper
  def list_quiz(user_id)
    Quizz.where(:created_by => user_id).collect { | quiz | [quiz.quiz_name, quiz.id]}
  end
end
