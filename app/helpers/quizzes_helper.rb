module QuizzesHelper
  
  def new_quiz
    link_to "create a new one?", new_quiz_path 
  end

  def quiz_detail(quiz_id)
    link_to "Detail", quiz_path(quiz_id), { :class => "btn btn-sm btn-default" }
  end
end
