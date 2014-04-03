class RoadblockCheck < ActiveRecord::Base
  belongs_to :roadblock
  acts_as_list scope: :roadblock
  belongs_to :check
end
