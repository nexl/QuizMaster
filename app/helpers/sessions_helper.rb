module SessionsHelper
  def set_login(user)
    session[:user_id] = user.id
    session[:first_name] = user.first_name
    session[:last_name] = user.last_name
  end
end
