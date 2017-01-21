require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #login" do
    it "Open login page" do
      get :login
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "Create new user" do
      new_user = FactoryGirl.attributes_for(:user)
      expect { post :create, params: { :user => new_user } }.to change(User, :count).by(1) 
    end
  end
  
end