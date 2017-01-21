require 'rails_helper'

RSpec.describe TryoutsController, type: :controller do
  
  let(:user)    { FactoryGirl.create(:user) }
  let(:quiz)    { FactoryGirl.create(:quizz, :created_by => user.id)}
  let(:question){ FactoryGirl.create(:question, :quizz_id => quiz.id)}
  let(:student){ FactoryGirl.create(:student, :quizz_id => quiz.id)}

  describe "POST #create" do
    it "Create new student answer" do
      new_answer = FactoryGirl.create(:student_answer, :question_id => question.id, :student_id => student.id)
      expect(StudentAnswer.count).to eq(1)
    end
  end

end