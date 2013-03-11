class ChangeCapFieldInCompanies < ActiveRecord::Migration
  def up
  	change_column :companies, :cap, :string
  end

  def down
  	change_column :companies, :cap, :integer
  end
end
