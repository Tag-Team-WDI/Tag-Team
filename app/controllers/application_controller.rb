class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end
  
  helper_method :current_user
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def require_login
    if !current_user
      redirect_to root_path
    end
  end
end
