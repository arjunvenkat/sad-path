class PagesController < ApplicationController
  def home
    if session[:user_id]
      @user = User.find(session[:user_id])
      @recent_roadblocks = Roadblock.order(created_at: :desc).limit(10)
    else
      redirect_to "/login"
    end
  end
end
