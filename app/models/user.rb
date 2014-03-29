class User < ActiveRecord::Base
  has_secure_password
  has_many :enrollments
  has_many :courses, through: :enrollments
  def roadblocks
    Roadblock.where("user1_id = #{self.id} OR user2_id = #{self.id}")
  end
end
