class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_user_2
  helper_method :current_course

  def current_course
    @current_course = @current_course || Course.find_by_id(session[:course_id])
  end

  def current_user
    @current_user = @current_user || User.find_by_id(session[:user_id])
  end

  def current_user_2
    @current_user_2 = @current_user_2 || User.find_by_id(session[:user2_id])
  end
end
