class AddIsglobalserviceToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :is_global_service, :boolean
  end
end
