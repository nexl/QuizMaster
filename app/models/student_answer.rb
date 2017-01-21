class StudentAnswer < ApplicationRecord

  belongs_to :student, :inverse_of => :student_answer, :foreign_key => "student_id"
  belongs_to :question, :foreign_key => "question_id", :inverse_of => :student_answer

  validates_presence_of :student_id, :question_id
end
