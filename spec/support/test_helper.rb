module TestHelper

  def login(user_id)
    user = User.find(user_id)
    request.session[:user_id] = user.id
  end

  def current_user
    User.find(request.session[:user_id])
  end

end