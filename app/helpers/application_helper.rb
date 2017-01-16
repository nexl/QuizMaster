module ApplicationHelper
  def list_quiz
    Quizz.all.collect { | quiz | [quiz.quiz_name, quiz.id]}
  end
end
