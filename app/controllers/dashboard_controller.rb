class DashboardController < ApplicationController
  def index
  	@user = current_user
  	@count_companies = Company.all.count
  end
end
