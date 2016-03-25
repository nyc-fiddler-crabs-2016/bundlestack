class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  helper_method :logged_in?
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :authorize_access

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize_access(object)
    halt 403 unless current_user == object.user.id
  end

  def logged_in?
    !!current_user
  end
end
