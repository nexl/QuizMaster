class StudentAnswer < ApplicationRecord

  belongs_to :user, :inverse_of => :student_answer, class_name: "User", :foreign_key => "student_id"
  belongs_to :question, :foreign_key => "question_id"

end
