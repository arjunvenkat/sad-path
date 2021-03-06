class User < ActiveRecord::Base
  has_secure_password
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :roadblocks, through: :enrollments, source: :roadblocks
  has_many :comments, dependent: :destroy

  validates :first, :last, :email, presence: true

  # def roadblocks
  #   Roadblock.where("user1_id = #{self.id} OR user2_id = #{self.id}")
  # end
end
