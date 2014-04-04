class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_user_2
  helper_method :current_course
  helper_method :current_roadblock
  helper_method :current_enrollment
  def current_course
    @current_course = @current_course || Course.find_by_id(session[:course_id])
  end

  def current_user
    @current_user = @current_user || User.find_by_id(session[:user_id])
  end

  def current_user_2
    @current_user_2 = @current_user_2 || User.find_by_id(session[:user2_id])
  end

  def current_roadblock
    @current_roadblock = @current_roadblock || Roadblock.find_by_id(session[:roadblock_id])
  end

  def current_enrollment
    @current_enrollment = @current_enrollment || Enrollment.where(course_id: current_course.id, user_id: current_user.id).first
  end

  def current_second_enrollment
    @current_second_enrollment = @current_second_enrollment || Enrollment.where(course_id: current_course.id, user_id: current_user_2.try(:id).try(:first))
  end

  before_action :check_if_logged_in

  def check_if_logged_in
    unless current_user
      redirect_to '/login'
    end
  end

end
