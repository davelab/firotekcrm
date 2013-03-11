class AddAdditionalFieldsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :office, :string
    add_column :clients, :secondary_mobile, :string
    add_column :clients, :province, :string
    add_column :clients, :position, :string
    add_column :clients, :description, :text
  end
end
