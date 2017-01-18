class StudentAnswer < ApplicationRecord

  belongs_to :student, :inverse_of => :student_answer, :foreign_key => "student_id"
  belongs_to :question, :foreign_key => "question_id", :inverse_of => :student_answer

end
