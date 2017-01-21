class Student < ApplicationRecord

  has_many :student_answer, :dependent => :destroy
  belongs_to :quizz, :foreign_key => "quizz_id"

  before_create :generate_token

  validates_presence_of :quizz_id, :full_name

  # Generate random token for students
  def generate_token
    self.token = SecureRandom.urlsafe_base64.to_s
  end

end
