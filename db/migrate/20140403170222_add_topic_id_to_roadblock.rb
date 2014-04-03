class AddTopicIdToRoadblock < ActiveRecord::Migration
  def change
    add_column :roadblocks, :topic_id, :integer
  end
end
