class Task < ActiveRecord::Base
  attr_accessible :description, :done, :due_date, :report_id, :user_id, :owner_id
  belongs_to :owner, :class_name => 'User', :foreign_key => :owner_id
  belongs_to :assigned, :class_name => 'User', :foreign_key => :user_id
  belongs_to :report
end
