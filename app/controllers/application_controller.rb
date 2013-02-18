class ApplicationController < ActionController::Base
	before_filter :authenticate_user!
  	load_and_authorize_resource
  	protect_from_forgery

  	rescue_from CanCan::AccessDenied do |exception|
    	redirect_to request.referer, :alert => "Non hai le autorizzazioni necessarie per eseguire questa operazione"
  	end
end
