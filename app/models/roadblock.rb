class Roadblock < ActiveRecord::Base
  def user1
    User.find(self.user1_id)
  end

  def user2
    User.find(self.user2_id)
  end
end
