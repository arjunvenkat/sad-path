class Comment < ActiveRecord::Base
  belongs_to :roadblock
  belongs_to :user
end
