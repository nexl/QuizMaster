class UsersController < ApplicationController
  def index; end
  
  def new 
    @user ||= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sign_in_path
    else
      redirect_to root_path
    end
  end

  def login
    @user ||= User.new
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :role, :email, :password)
  end
end
