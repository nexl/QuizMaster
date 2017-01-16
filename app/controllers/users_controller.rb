class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new 
    @user ||= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :role, :email, :password)
  end
end
