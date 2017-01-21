require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  
  let(:user)    { FactoryGirl.create(:user) }
  let(:quiz)    { FactoryGirl.create(:quizz, :created_by => user.id)}
  let(:question){ FactoryGirl.create(:question, :quizz_id => quiz.id)}
  
  describe "POST #create" do
    it "Create new student" do
      new_student = FactoryGirl.create(:student, :quizz_id => quiz.id)
      expect(Student.count).to eq(1)
    end
  end
  
end