class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :company_id
      t.integer :client_id
      t.string :title
      t.text :description
      t.datetime :executed_at

      t.timestamps
    end
  end
end
