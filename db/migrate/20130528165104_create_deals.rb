class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :protocol_number
      t.integer :user_id
      t.integer :legal_company
      t.integer :operative_company
      t.string :description
      t.string :shipment
      t.float :amount_offered
      t.float :amount_accepted
      t.string :status

      t.timestamps
    end
  end
end
