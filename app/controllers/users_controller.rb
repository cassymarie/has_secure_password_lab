class UsersController < ApplicationController
  before_action :authentication_required, only: [:show]
  
  def new
    @user = User.new
  end

  def show
  end

  def create
    #binding.pry
    return redirect_to signup_path unless params[:user][:password] == params[:user][:password_confirmation] 

      user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to home_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
