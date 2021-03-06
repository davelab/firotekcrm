class ApplicationController < ActionController::Base
	include ActionView::Helpers::NumberHelper
	include ApplicationHelper
    
	before_filter :authenticate_user!
    

  	protect_from_forgery

  	rescue_from CanCan::AccessDenied do |exception|
    	redirect_to root_url, :alert => "Non hai le autorizzazioni necessarie per eseguire questa operazione"
  	end


end
