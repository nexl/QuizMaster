class Question < ApplicationRecord

  has_many :student_answer

  belongs_to :quizz, :foreign_key => "quizz_id"

  validates_presence_of :question_content, :answer

  def next
    self.class.where("id > ? and quizz_id = ?", id, quizz_id).first
  end

end
