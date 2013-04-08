class DashboardController < ApplicationController
  def index
  	@user = current_user

    @client = Client.all

  	@tot_companies = Company.all.count
  	@tot_clients = @client.count
  	@tot_reports = Report.all.count

  	@tot_user_client = Client.where(:user_id => current_user.id).count
    @tot_user_reports = Report.where(:user_id => current_user.id).count
    
  	@tot_user_companies = Company.includes(:user).where('users.id' => current_user.id).count


    @percentuale_companies = percentage(@tot_companies, @tot_user_companies)
  	@percentuale_clienti = percentage(@tot_clients, @tot_user_client) 
  	@percentuale_report = percentage(@tot_reports, @tot_user_reports)


  	 
  end
end
