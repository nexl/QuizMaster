require 'rails_helper'

RSpec.describe StudentAnswer, :type => :model do

  it "Answer a question" do
    user = FactoryGirl.create(:user)
    quiz = FactoryGirl.create(:quizz, :created_by => user.id)
    question = FactoryGirl.create(:question, :quizz_id => quiz.id)
    student = FactoryGirl.create(:student, :quizz_id => quiz.id)
    #answer = FactoryGirl.create(:student_answer_true, :question_id => question.id, :student_id => student.id) 
    answer = StudentAnswer.create(:student_id => student.id, :question_id => question.id, :answer => "my first answer")
    answer.valid?
  end

  describe StudentAnswer do
    it { is_expected.to validate_presence_of(:student_id) }
    it { is_expected.to validate_presence_of(:question_id) }
  end
  
end