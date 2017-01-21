require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
    describe "GET #index" do
    it "Quiz index page" do
      user = FactoryGirl.create(:user)
      login(user.id)
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "Create new user" do
      user = FactoryGirl.create(:user)
      login(user.id)
      new_user = FactoryGirl.attributes_for(:quizz, :created_by => current_user)
      expect { post :create, params: { :quizz => new_user } }.to change(Quizz, :count).by(1) 
    end
  end
  
  describe "GET #new" do
    it "New quiz page" do
      user = FactoryGirl.create(:user)
      login(user.id)
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
  
end