class SessionsController < ApplicationController
  include SessionsHelper
  def create
      user = User.find_by_email(params[:user][:email])
      if user.nil?
        return redirect_to logon_path
      end
      if user && user.authenticate(params[:user][:password])
        set_login(user)
        redirect_to user
      else
        redirect_to logon_path
      end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
