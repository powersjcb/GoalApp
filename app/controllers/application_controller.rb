class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :current_user_id

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def current_user_id
    current_user.id if logged_in?
  end

  def log_in(user)
    session[:session_token] = user.reset_session_token!
  end

  def herd_user
    redirect_to new_session_url unless logged_in?
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
