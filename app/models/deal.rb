class Deal < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :amount_accepted, :amount_offered, :description, :legal_company, :operative_company, :protocol_number, :shipment, :status, :user_id
=======
  attr_accessible :billed_company, :offered_import, :operative_company, :protocol_number, :real_import, :shipment_mode, :status, :user_id, :description
  belongs_to :user
  belongs_to :billed, :class_name => 'Company', :foreign_key => :billed_company
  belongs_to :operative, :class_name => 'Company', :foreign_key => :operative_company

  validates :billed_company, :offered_import, :operative_company, :user_id, presence: {message: "campo obbligatorio"}
>>>>>>> deals
end
