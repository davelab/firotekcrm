class ChangeTypeDescriptionInTasks < ActiveRecord::Migration
  def up
    change_column :tasks, :description, :text
  end

  def down
    change_column :tasks, :description, :integer
  end
end
