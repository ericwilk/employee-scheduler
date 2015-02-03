class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  def current_user_session
    @current_user_session ||= UserSession.find
  end
  
  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end
  
  def authenticate
    unless current_user
      flash[:notice] = "You must login prior to accessing this page."
      redirect_to new_user_session_path
      return false
    end
  end

  def admin?
    current_user && current_user.type.downcase == "administrator"
  end
end
