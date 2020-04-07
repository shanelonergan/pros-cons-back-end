class CreateListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.string :name
      t.integer :rank
      t.belongs_to :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
