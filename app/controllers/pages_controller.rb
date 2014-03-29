class PagesController < ApplicationController
  def home
    if session[:user_id]
      current_course = Course.find(session[:course_id])
      @user = User.find(session[:user_id])
      @recent_roadblocks = current_course.roadblocks.order(created_at: :desc).limit(10)
    else
      redirect_to "/login"
    end
  end
end
