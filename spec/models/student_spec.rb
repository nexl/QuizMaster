require 'rails_helper'

RSpec.describe Student, :type => :model do

  it "Create new student" do
    user = FactoryGirl.create(:user)
    quiz = FactoryGirl.create(:quizz, :created_by => user.id)
    student = FactoryGirl.create(:student, :quizz_id => quiz.id)
    student.valid?
  end

  describe Student do
    it { is_expected.to validate_presence_of(:quizz_id) }
    it { is_expected.to validate_presence_of(:full_name) }
  end
  
end