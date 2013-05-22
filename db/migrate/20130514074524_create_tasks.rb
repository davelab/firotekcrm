class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :report_id
      t.integer :description
      t.datetime :due_date
      t.boolean :done

      t.timestamps
    end
  end
end
