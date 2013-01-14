class FixClientsColoumnName < ActiveRecord::Migration
  def change
  	change_table :Clients do |t|
      t.rename :surename, :surname
      end
  end

end
