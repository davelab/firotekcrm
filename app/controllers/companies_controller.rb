class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json


  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    format.csv { send_data @companies.to_csv }
    format.xls # { send_data @companies.to_csv(col_sep: "\t") }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.includes(:category, :clients, :notes, :reports).find(params[:id])
    @reports = @company.reports.paginate(:page => params[:page], :per_page => 30).order(:executed_at).reverse_order

    @notes = Note.new

    @mapCompany = Company.find(params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company creata correttamente' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company aggiornata correttamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  def clients_associated_to_company
      if params[:id].present?
        @associated_clients = Company.find(params[:id]).clients
      else
        @associated_cliets = []
      end

      respond_to do |format|
        format.js
      end
  end
end
