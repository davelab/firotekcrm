class User < ActiveRecord::Base

  has_many :assignments
  has_many :roles, :through => :assignments

  has_many :client

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

def get_role
  roles.each { |role| role.name.downcase }
end

#Restituisce tutti gli utenti non associati a un client
scope :missing_user,
    includes(:client).where("clients.id is null")
end

