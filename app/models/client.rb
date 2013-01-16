class Client < ActiveRecord::Base
  attr_accessible 	:mobile, 
  					:name, 
  					:surname, 
  					:email,
  					:address,
  					:cap,
  					:city, 
            :region,
  					:status,
  					:company_ids,
            :user_id

  has_many :partenership
  has_many :companies, :through => :partenership
  has_one :user
  accepts_nested_attributes_for :companies, :user

  validates :name, :surname, :status, :email, :mobile,  presence: {message: "campo obbligatorio"}
  validates :email, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, message: "Formato non corretto" }  

	def full_name
	    [name, surname].join(' ')
	end

  	def full_address
		"#{address}, #{cap}, #{city}".titleize
		
	end
  


end

