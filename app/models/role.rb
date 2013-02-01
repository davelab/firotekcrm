class Role < ActiveRecord::Base
  attr_accessible :name, :slug

  has_many :assignments
  has_many :users, :through => :assignments


end
