class StudentAnswer < ApplicationRecord

  belongs_to :student, :inverse_of => :student_answer, :foreign_key => "student_id"
  belongs_to :question, :foreign_key => "question_id", :inverse_of => :student_answer

  validates_presence_of :student_id, :question_id

  def self.remaining_question(student_id, token)
    joins(:question, :student).where(:student_id => student_id, :answer => nil).where("students.token = ?", token).select("question_content, student_answers.id")
  end

  def self.get_result(student_id)
    joins(:question).where(:student_id => student_id).select("question_content, is_right, student_answers.id")
  end

  def self.participant(quizz_id)
    joins(:question).where('questions.quizz_id = ?', quizz_id)
  end
end