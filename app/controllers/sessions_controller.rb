class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:user][:email])
    if user.nil?
      flash[:error] = 'Invalid email or password'
      return redirect_to sign_in_path
    end
    if user && user.authenticate(params[:user][:password])
      set_login(user)
      flash[:success] = "Login success"
      redirect_to quizzes_path
    else
      redirect_to sign_in
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private 

  def set_login(user)
    session[:user_id] = user.id
  end
end
