class Check < ActiveRecord::Base
  has_many :roadblock_checks, dependent: :destroy
  has_many :roadblocks, through: :roadblock_checks
end
