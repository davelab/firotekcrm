class CreateCompaniesRelationships < ActiveRecord::Migration
  def change
    create_table :companies_relationships do |t|
      t.integer :company_id
      t.integer :associated_company_id

      t.timestamps
    end
  end
end
