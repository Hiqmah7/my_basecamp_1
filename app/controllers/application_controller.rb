class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    redirect_to new_session_path, alert: "You must log in first" unless logged_in?
  end

  def authorize_admin!
    redirect_to root_path, alert: "Not authorized" unless current_user&.admin?
  end
end
