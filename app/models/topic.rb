class Topic < ActiveRecord::Base
  belongs_to :course
  acts_as_list scope: :course
  has_many :roadblocks

  def current?
    self.course.current_topic_id == self.id ? true : false
  end

  def set_current
    self.course.current_topic_id = self.id
    self.course.save
  end
end
