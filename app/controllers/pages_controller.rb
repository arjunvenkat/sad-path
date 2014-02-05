class PagesController < ApplicationController
  def home
    @user = User.first
    @recent_roadblocks = Roadblock.limit(10)
  end
end
