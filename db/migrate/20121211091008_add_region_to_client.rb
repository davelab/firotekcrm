class AddRegionToClient < ActiveRecord::Migration
  def change
    add_column :clients, :region, :string
  end
end
