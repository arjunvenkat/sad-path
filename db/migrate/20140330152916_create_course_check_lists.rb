class CreateCourseCheckLists < ActiveRecord::Migration
  def change
    create_table :course_check_lists do |t|
      t.integer :course_id
      t.integer :check_list_id

      t.timestamps
    end
  end
end
