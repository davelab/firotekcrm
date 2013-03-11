class Partenership < ActiveRecord::Base
  attr_accessible :client_id, :company_id
  belongs_to :company
  belongs_to :client
  
end
