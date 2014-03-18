class AddCourseIdToRoadblock < ActiveRecord::Migration
  def change
    add_column :roadblocks, :course_id, :integer
  end
end
