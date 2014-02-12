class User < ActiveRecord::Base
  has_secure_password
  def roadblocks
    Roadblock.where("user1_id = #{self.id} OR user2_id = #{self.id}")
  end
end
