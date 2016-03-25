class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :authorize_access

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize_access(object)
    halt 403 unless current_user == object.user.id
  end

end
