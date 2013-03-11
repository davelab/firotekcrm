class CompaniesRelationship < ActiveRecord::Base
  attr_accessible :associated_company_id, :company_id
  belongs_to :company, :class_name => "Company", :foreign_key => "company_id"
  belongs_to :associated_company, :class_name => "Company", :foreign_key => "associated_company_id"

end
