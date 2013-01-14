class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.integer :cap
      t.string :city
      t.integer :category_id

      t.timestamps
    end
  end
end
