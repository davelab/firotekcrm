class User < ActiveRecord::Base

  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :client
  has_many :owners, :class_name => "Task", :foreign_key => :owner_id
  has_many :assigneds, :class_name => "Task", :foreign_key => :user_id

  has_many :user_company_assignments
  has_many :companies, :through => :user_company_assignments
  

  validates :username,  presence: {message: "campo obbligatorio"}

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :slug, :username, :password, :password_confirmation, :remember_me, :role_ids
  # attr_accessible :title, :body   

def has_role?(role_sym)
  roles.any? { |r| r.name.underscore.to_sym == role_sym }
end

def role_names
  roles.map{|r| r.slug.downcase }.join(', ')
end

#Restituisce tutti gli utenti non associati a un client
scope :missing_user,
    includes(:client).where("clients.id is null")
end

