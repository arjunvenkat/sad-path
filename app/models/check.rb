class Check < ActiveRecord::Base
  has_many :roadblock_checks
  has_many :roadblocks, through: :roadblock_checks
end
