class CheckListItem < ActiveRecord::Base
  belongs_to :check
  belongs_to :check_list
  acts_as_list scope: :check_list
end
