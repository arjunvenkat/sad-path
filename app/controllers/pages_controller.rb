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
      @current_roadblock = Roadblock.create(course_id: current_course.id, topic_id: current_course.current_topic_id ,user1_id: session[:user_id], user2_id: session[:user2_id])
      check_list_items = current_course.check_lists.first.check_list_items
      check_list_items.each do |cli|
        @current_roadblock.roadblock_checks.create(check_id: cli.check.id)
      end
      session[:roadblock_id] = @current_roadblock.id
    end
    @completed_rbchecks = @current_roadblock.roadblock_checks
        .where('completed_at > ?', DateTime.new(1970,1,1))
    if @completed_rbchecks.present?
      @next_rbcheck = @completed_rbchecks
          .reorder('position ASC')
          .last
          .lower_item
    else
      @next_rbcheck = @current_roadblock.roadblock_checks.reorder('position ASC').first
    end
  end

  def move_on
    session[:roadblock_id] = nil
    redirect_to :back
  end

end
