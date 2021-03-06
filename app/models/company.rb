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
						:description,
						:province, 
						:user_ids
						
	#END Attributes Properties

	#Relations
		#client
		has_many :partenership
		has_many :clients, :through => :partenership
		#company
		has_many :companies_relationship
		has_many :associated_company, :through => :companies_relationship
		#company inverse association
		has_many :inverse_companies_relationship, :class_name => "CompaniesRelationship", :foreign_key => "associated_company_id"
		has_many :inverse_associated_company, :through => :inverse_companies_relationship, :source => :company
		#user
		has_many :user_company_assignments
		has_many :user, :through => :user_company_assignments

		has_many :notes
		has_many :reports, :dependent => :destroy


		has_many :billeds, :class_name => "Deal", :foreign_key => :billed_company
		has_many :operatives, :class_name => "Deal", :foreign_key => :operative_company
		has_many :deals, :dependent => :destroy, :foreign_key => :billed_company

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
		validates :name, :address, :cap, :address, :city, :category_id,  presence: {message: "campo obbligatorio"}
		#validates :email, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, message: "Formato non corretto" }  
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
		#recupera tutte le società che hanno il campo is_global_service vero
		scope :global_services, where(:is_global_service => true)
		
		scope :user_owned, lambda { |uid| includes(:user).where('user_id = ?', uid) }
	
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
