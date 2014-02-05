class User < ActiveRecord::Base
  def roadblocks
    Roadblock.where("user1_id = #{self.id} OR user2_id = #{self.id}")
  end
end
