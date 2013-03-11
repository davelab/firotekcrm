class CreateUserCompanyAssignments < ActiveRecord::Migration
  def change
    create_table :user_company_assignments do |t|
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end

  	  	add_index :user_company_assignments, :user_id
  		add_index :user_company_assignments, :company_id

  end
end
