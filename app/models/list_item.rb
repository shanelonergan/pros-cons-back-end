class ListItem < ApplicationRecord
  # type keeps track of whether it is a pro or a con. true = pro, false = con
  belongs_to :list
  validates :name, :type, presence: true
end
