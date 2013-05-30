class Deal < ActiveRecord::Base
  attr_accessible :billed_company, :offered_import, :operative_company, :protocol_number, :real_import, :shipment_mode, :status, :user_id, :description
end
