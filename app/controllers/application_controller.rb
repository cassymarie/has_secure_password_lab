class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id]
  end

  def authentication_required
     redirect_to login_path unless logged_in?
  end
end
