class FixClientsColoumnName < ActiveRecord::Migration
  def change
  	change_table :clients do |t|
      t.rename :surename, :surname
      end
  end

end
