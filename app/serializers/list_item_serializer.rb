class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :rank
  has_one :list
end
