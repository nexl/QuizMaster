require 'rails_helper'

RSpec.describe Question, :type => :model do

  it "Create new question" do
    user = FactoryGirl.create(:user)
    quiz = FactoryGirl.create(:quizz, :created_by => user.id)
    question = FactoryGirl.create(:question, :quizz_id => quiz.id)
    question.valid?
    expect(quiz.created_by).to eq user.id
    expect(question.quizz_id).to eq quiz.id
  end

  describe Question do
    it { is_expected.to validate_presence_of(:answer) }
    it { is_expected.to validate_presence_of(:question_content) }
  end
  
end