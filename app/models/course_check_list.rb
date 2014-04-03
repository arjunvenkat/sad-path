class CourseCheckList < ActiveRecord::Base
  belongs_to :course
  belongs_to :check_list
end
