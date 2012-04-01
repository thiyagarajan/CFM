class ApplicationController < ActionController::Base


  protect_from_forgery
  helper_method :current_user
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_user_login

    if session[:user_id] == nil
    redirect_to new_session_path
    end
  end

  def cache_clear
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
  end

end