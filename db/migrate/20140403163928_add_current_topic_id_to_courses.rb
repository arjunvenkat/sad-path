class AddCurrentTopicIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :current_topic_id, :integer
  end
end
