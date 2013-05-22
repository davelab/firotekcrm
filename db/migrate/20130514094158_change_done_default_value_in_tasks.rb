class ChangeDoneDefaultValueInTasks < ActiveRecord::Migration
  def up
    change_column :tasks, :done, :boolean, :null => false, :default => "0"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
