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
            :office, 
            :secondary_mobile, 
            :province, 
            :position, 
            :description, 
  					:company_ids,
            :user_id
          

  has_many :partenership
  has_many :companies, :through => :partenership
  has_many :reports
  belongs_to :user
  
  accepts_nested_attributes_for :companies

  validates :name, :surname, :status, :email, :mobile,  presence: {message: "campo obbligatorio"}
  validates :email, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, message: "Formato non corretto" }  

	def full_name
	    [name, surname].join(' ')
	end

  def full_address    
		"#{address}, #{cap}, #{city}, #{province}" if address
	end


  


end

