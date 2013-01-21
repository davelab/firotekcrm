class Company < ActiveRecord::Base

	acts_as_gmappable

	#Attributes Properties
		attr_accessible :address, 
						:cap, 
						:region,
						:category_id, 
						:client_ids, 
						:city, 
						:name,
						:phone,
						:mobile,
						:fax,
						:website,
						:email,
						:is_global_service,
						:associated_company_ids,
						:latitude,
						:longitude,
						:note_ids,
						:acquisition,
						:province
	#END Attributes Properties

	#Relations
		#client
		has_many :partenership
		has_many :clients, :through => :partenership
		#company
		has_many :companies_relationship
		has_many :associated_company, :through => :companies_relationship
		
		has_many :inverse_companies_relationship, :class_name => "CompaniesRelationship", :foreign_key => "associated_company_id"
		has_many :inverse_associated_company, :through => :inverse_companies_relationship, :source => :company


		has_many :notes

		belongs_to :category
	#END Relations

	#Nested attributes
		accepts_nested_attributes_for :clients
		accepts_nested_attributes_for :notes, :reject_if => :all_blank, :allow_destroy => true
	#end Nested attributes
	

	#Geocoder
		geocoded_by :full_address
		after_validation :geocode, if: :address_changed?
	#end Geocoder

  	#Validation
		validates :name, :address, :cap, :email, :address, :city, :category_id,  presence: {message: "campo obbligatorio"}
		validates :email, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, message: "Formato non corretto" }  
		validates :cap, numericality: {only_integer: true, message: "formato non corretto"}
	#END Validation

  	# validates_presence_of :associated_company_ids,  :unless => proc{|obj| obj.is_global_service == 0}

	#Custom Methods
		def full_address
			"#{address}, #{cap}, #{city}".titleize
		end

		def gmaps4rails_address
		  "#{address}, #{cap}, #{city}".titleize
		end

	
	#END Custom Methods

	#Scopes
		scope :global_services, where(:is_global_service => true)
	#END Scopes

	def self.to_csv(options = {})
		  CSV.generate(options) do |csv|
		    csv << column_names
		    all.each do |product|
		      csv << product.attributes.values_at(*column_names)
		    end
		  end
		end

 		
 	ACQUISITIONS = { "Leads" => 1 , "Potenziale" => 2 , "Acquisito" => 3 }

	def self.getAcquisition(value)
		 ACQUISITIONS.index(value) 
	end


end
