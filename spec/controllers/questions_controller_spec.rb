require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  
  let(:user)    { FactoryGirl.create(:user) }
  let(:quiz)    { FactoryGirl.create(:quizz, :created_by => user.id)}
  let(:question){ FactoryGirl.create(:question, :quizz_id => quiz.id)}

  # New
  describe "GET #new" do
    it "Open new question page" do
      login(user.id)
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
  
  # Create
  describe "POST #create" do
    it "Create new question" do
      new_question = FactoryGirl.attributes_for(:question, :quizz_id => quiz.id)
      login(user.id)
      expect { post :create, :params => { :question => new_question } }.to change(Question, :count).by(1) 
    end
  end

  # Destroy
  describe "DELETE #destroy" do
    it "Delete question" do
      login(user.id)
      delete :destroy, :params => { :id => question.id }
    end
  end

  describe "PUT #update" do
    it "Update question" do
      login(user.id)
      put :update, :id => question.id, :question => question.attributes = { :question_content => "New question"}
      expect redirect_to(quiz_path(question.quizz_id))
    end
  end
end