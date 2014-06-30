class CourseCheckList < ActiveRecord::Base
  belongs_to :course
  belongs_to :check_list

  def current?
    self.course.current_course_check_list_id == self.id
  end

  def set_current
    self.course.current_course_check_list_id = self.id
    self.course.save
    self.course.reset_blank_roadblocks
  end
end
