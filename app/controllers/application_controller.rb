class ApplicationController < ActionController::Base
  #  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  
  # Require natton and nkf for Kanji -> yomi
  require 'natto'
  require 'nkf'

  def logged_in?
    session[:user_id].present?
  end

  # Check if user is already logged in ?
  def require_login
    redirect_to root_path unless logged_in?
  end

  def does_not_require_login
    redirect_to root_path if logged_in?
  end

  # Get current user info
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end

end
