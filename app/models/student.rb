class Student < ApplicationRecord

  has_many :student_answer, :dependent => :destroy
  belongs_to :quizz, :foreign_key => "quizz_id"

end
