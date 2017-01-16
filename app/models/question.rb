class Question < ApplicationRecord

  has_many :student_answer

  belongs_to :quizz, :foreign_key => "quiz_id"

end
