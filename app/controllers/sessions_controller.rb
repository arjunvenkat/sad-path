class SessionsController < ApplicationController
  def new

  end

  def create
    u = User.find_by_email(params[:email])
    if u && session[:user_id]
      if session[:user_id].to_i == u.id
        redirect_to "/login", notice: "User has already signed in"
      elsif session[:user_id].to_i != u.id && u.authenticate(params[:password])
        session[:user2_id] = u.id
        redirect_to "/"
      end
    elsif u && u.authenticate(params[:password])
      session[:user_id] = u.id
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
