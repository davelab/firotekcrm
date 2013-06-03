class Deal < ActiveRecord::Base
  attr_accessible :amount_accepted, :amount_offered, :description, :legal_company, :operative_company, :protocol_number, :shipment, :status, :user_id
end
