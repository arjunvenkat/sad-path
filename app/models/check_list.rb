class CheckList < ActiveRecord::Base
  has_many :check_list_items, -> { order("position ASC") }
end
