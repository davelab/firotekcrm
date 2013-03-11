class RanameTypeInRole < ActiveRecord::Migration
  def change
  	change_table :Roles do |t|
      t.rename :type, :name
      end
  end
end
