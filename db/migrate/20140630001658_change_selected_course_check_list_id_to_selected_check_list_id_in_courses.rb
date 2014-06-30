class ChangeSelectedCourseCheckListIdToSelectedCheckListIdInCourses < ActiveRecord::Migration
  def up
    rename_column :courses, :selected_course_check_list_id, :current_course_check_list_id
  end

  def down
    rename_column :courses, :current_course_check_list_id, :selected_course_check_list_id
  end
end
