class RemoveUserIdFromClients < ActiveRecord::Migration
  def up
    remove_column :clients, :user_id
  end

  def down
    add_column :clients, :user_id, :integer
  end
end
