require 'rails_helper'

RSpec.describe Quizz, :type => :model do

  it "Create new quiz" do
    user = FactoryGirl.create(:user)
    quiz = FactoryGirl.create(:quizz,:created_by  => user.id)
    quiz.valid?
    expect(quiz.created_by).to eq user.id
  end

  describe Quizz do
    it { is_expected.to validate_presence_of(:created_by) }
    it { is_expected.to validate_presence_of(:quiz_name) }
  end
  
end