class ListItem < ApplicationRecord
  belongs_to :list
  validates :name, presence: true
end