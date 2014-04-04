class Roadblock < ActiveRecord::Base
  # belongs_to :course
  belongs_to :topic
  has_many :roadblock_checks, -> { order("position ASC") }, dependent: :destroy
  has_many :checks, through: :roadblock_checks

  def course
    enrollment.course
  end

  def enrollment
    Enrollment.find(enrollment_id)
  end

  def second_enrollment
    Enrollment.find(second_enrollment_id)
  end

  def user1
    enrollment.user
    # if self.user1_id
    #   User.find(self.user1_id)
    # end
  end

  def user2
    second_enrollment.user
    # if self.user2_id
    #   User.find(self.user2_id)
    # end
  end

end
