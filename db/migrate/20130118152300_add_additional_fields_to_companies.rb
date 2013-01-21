class AddAdditionalFieldsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :province, :string
    add_column :companies, :acquisition, :integer
  end
end
