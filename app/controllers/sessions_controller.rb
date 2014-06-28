class SessionsController < ApplicationController
  skip_before_action :check_if_logged_in, only: [:new, :create]

  def set_current_course
    session[:course_id] = params[:course_id]

    redirect_to "/roadblocks"
  end

  def new

  end

  def create
    u = User.find_by_email(params[:email])
    if u && session[:user_id]
      current_course = Course.find(session[:course_id])
      in_same_course = current_course.users.where(id: u.id).count > 0
      if in_same_course
        if session[:user_id].to_i == u.id
          redirect_to "/login", notice: "User has already signed in"
        elsif session[:user_id].to_i != u.id && u.authenticate(params[:password])
          session[:user2_id] = u.id
          redirect_to "/"
        end
      else
        redirect_to "/login", notice: "Partner must be in the same class. Make sure you've selected the right class from the navbar."
      end
    elsif u && u.authenticate(params[:password])
      session[:user_id] = u.id
      session[:course_id] = u.courses.last.id
      redirect_to "/"
    else
      redirect_to "/login", notice: "Your email or password is incorrect"
    end
  end

  def destroy
    reset_session
    redirect_to "/login"
  end
end
