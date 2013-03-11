class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surename
      t.string :mobile

      t.timestamps
    end
  end
end
