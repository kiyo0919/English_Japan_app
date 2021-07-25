class RemoveDeletedAtFromUsers < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :deleted_at, :datetime
  end
  
  def down
    add_column :users, :is_deleted, :boolean
  end
end
