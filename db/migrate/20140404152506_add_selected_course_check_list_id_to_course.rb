class AddSelectedCourseCheckListIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :selected_course_check_list_id, :integer
  end
end
