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

  def stuck
    unless current_roadblock
      @current_roadblock = Roadblock.create(course_id: session[:course_id], user1_id: session[:user_id], user2_id: session[:user2_id])
      Check.all.each do |check|
        @current_roadblock.roadblock_checks.create(check_id: check.id)
      end
      session[:roadblock_id] = @current_roadblock.id
    end
  end
end
