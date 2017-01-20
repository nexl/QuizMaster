class SessionsController < ApplicationController
  include SessionsHelper
  def create
      user = User.find_by_email(params[:user][:email])
      if user.nil?
        return redirect_to sign_in_path
      end
      if user && user.authenticate(params[:user][:password])
        set_login(user)
        redirect_to quizzes_path
      else
        redirect_to sign_in
      end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
