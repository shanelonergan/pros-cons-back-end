class AddProToListItem < ActiveRecord::Migration[6.0]
  def change
    add_column :list_items, :pro, :boolean
  end
end
