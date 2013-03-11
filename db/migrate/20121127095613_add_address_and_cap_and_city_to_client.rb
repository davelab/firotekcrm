class AddAddressAndCapAndCityToClient < ActiveRecord::Migration
  def change
    add_column :clients, :address, :string
    add_column :clients, :cap, :string
    add_column :clients, :city, :string
  end
end
