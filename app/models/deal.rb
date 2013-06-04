class Deal < ActiveRecord::Base

  attr_accessible :billed_company, :offered_import, :operative_company, :protocol_number, :real_import, :shipment_mode, :status, :user_id, :description
  belongs_to :user
  belongs_to :billed, :class_name => 'Company', :foreign_key => :billed_company
  belongs_to :operative, :class_name => 'Company', :foreign_key => :operative_company

  validates :billed_company, :offered_import, :operative_company, :user_id, presence: {message: "campo obbligatorio"}

end
