class CourseCheckList < ActiveRecord::Base
  belongs_to :course
  belongs_to :check_list

  def current?
    self.course.current_course_check_list_id == self.id
  end

  def set_current
    #TODO: Fix bug here in heroku
    self.course.current_course_check_list_id = self.id
    result = self.course.save
    puts "did it save? #{result}"

    self.course.reset_blank_roadblocks
  end
end
