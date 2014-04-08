class PagesController < ApplicationController
  skip_before_action :check_if_logged_in, only: [:enroll]

  def home
    if session[:user_id]
      current_course = Course.find(session[:course_id])
      @user = User.find(session[:user_id])
      @recent_roadblocks = current_course.roadblocks.order(created_at: :desc).limit(10)
    else
      redirect_to "/login"
    end
  end

  def roadblocks
    if params[:filter] == 'class-solved'
      @roadblocks = current_course.current_topic.roadblocks.where(solved: true)
      @filter = 'class-solved'
    elsif params[:filter] == 'class-open'
      @roadblocks = current_course.current_topic.roadblocks.where(need_help: true)
      @filter = 'class-open'
    elsif params[:filter] == 'your-solved'
      @roadblocks = current_enrollment.roadblocks.where(solved: true)
      @filter = 'your-solved'
    elsif params[:filter] == 'your-open'
      @roadblocks = current_enrollment.roadblocks.where(need_help: true)
      @filter = 'your-open'
    elsif params[:filter] == 'your-unfinished'
      @roadblocks = current_enrollment.roadblocks.where(solved: false, need_help: false)
      @filter = 'your-unfinished'
    else
      @roadblocks = current_course.roadblocks
    end
  end

  def error
    @errors = []
    if current_course.current_topic_id.blank?
      @errors << "Ask your instructor to select a topic for this course"
    end
    if current_course.selected_check_list.blank?
      @errors << "Ask your instructor to select a checklist for this course"
    end
  end

  def enroll
    @course = Course.find_by_enrollment_hash(params[:enrollment_hash])
    # if current_user
    #   Enrollment.create(course_id: @course.id, user_id: current_user.id)
    #   if current_user_2
    #     Enrollment.create(course_id: @course.id, user_id: current_user_2.id)
    #   end
    #   redirect_to root_url
    # else
    #   render 'enroll'
    # end
    render 'enroll'
  end


  def stuck
    if current_course.current_topic_id.blank? || current_course.selected_check_list.blank?
      redirect_to '/error'
    else
      unless current_roadblock
        @current_roadblock = Roadblock.create(course_id: current_course.id, topic_id: current_course.current_topic_id ,user1_id: session[:user_id], user2_id: session[:user2_id], enrollment_id: current_enrollment.id, second_enrollment_id: current_second_enrollment.try(:id))
        check_list_items = current_course.selected_check_list.check_list_items
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
  end

  def move_on
    session[:roadblock_id] = nil
    redirect_to :back
  end

end
