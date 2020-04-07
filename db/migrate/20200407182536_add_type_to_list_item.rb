class AddTypeToListItem < ActiveRecord::Migration[6.0]
  def change
    add_column :list_items, :type, :boolean
  end
end
