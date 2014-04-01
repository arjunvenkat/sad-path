class RoadblockCheck < ActiveRecord::Base
  belongs_to :roadblock
  belongs_to :check
end
