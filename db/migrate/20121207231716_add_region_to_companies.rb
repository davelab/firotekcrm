class AddRegionToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :region, :string
  end
end
