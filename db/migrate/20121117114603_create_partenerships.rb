class CreatePartenerships < ActiveRecord::Migration
  def change
    create_table :partenerships do |t|
      t.integer :client_id
      t.integer :company_id

      t.timestamps
    end
  end
end
