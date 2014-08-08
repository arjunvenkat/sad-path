class Roadblock < ActiveRecord::Base
  # belongs_to :course
  default_scope order('created_at DESC')
  belongs_to :topic
  has_many :roadblock_checks, -> { order("position ASC") }, dependent: :destroy
  has_many :checks, through: :roadblock_checks
  has_many :comments, dependent: :destroy

  def blank?
    blank = true
    self.roadblock_checks.each do |rbc|
      blank = false if rbc.completed_at != "1970-01-01 00:00:00"
    end
    blank
  end

  def course
    enrollment.course
  end

  def enrollment
    Enrollment.find_by_id(enrollment_id)
  end

  def second_enrollment
    Enrollment.find_by_id(second_enrollment_id)
  end

  def user1
    enrollment.user
    # if self.user1_id
    #   User.find(self.user1_id)
    # end
  end

  def user2
    second_enrollment.try(:user)
    # if self.user2_id
    #   User.find(self.user2_id)
    # end
  end

end
