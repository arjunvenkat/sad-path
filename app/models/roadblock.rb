class Roadblock < ActiveRecord::Base
  belongs_to :course
  has_many :roadblock_checks
  has_many :checks, through: :roadblock_checks

  def user1
    if self.user1_id
      User.find(self.user1_id)
    end
  end

  def user2
    if self.user2_id
      User.find(self.user2_id)
    end
  end
end
