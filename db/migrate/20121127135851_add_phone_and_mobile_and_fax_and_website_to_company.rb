class AddPhoneAndMobileAndFaxAndWebsiteToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :phone, :string
    add_column :companies, :mobile, :string
    add_column :companies, :fax, :string
    add_column :companies, :website, :string
  end
end
