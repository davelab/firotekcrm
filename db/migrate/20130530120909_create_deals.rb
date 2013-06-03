class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :protocol_number
      t.integer :user_id
      t.integer :billed_company
      t.integer :operative_company
      t.text :description
      t.float :offered_import
      t.float :real_import
      t.string :status
      t.string :shipment_mode

      t.timestamps
    end
  end
end
