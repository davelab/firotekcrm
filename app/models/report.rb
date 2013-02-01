class Report < ActiveRecord::Base
  attr_accessible :client_id, :company_id, :description, :title, :user_id, :executed_at
  belongs_to :user
  belongs_to :company
  belongs_to :client

  REPORT_TYPES = [ "Visita", "Telefonata",  "Sopralluogo Tecnico",  "Porta a porta" ]



end
