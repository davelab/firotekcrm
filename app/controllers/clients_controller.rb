class ClientsController < ApplicationController

  load_and_authorize_resource
  # GET /clients
  # GET /clients.json
  def index

  if can? :view_all_records, @user
    @clients = Client.includes(:companies, :user).all
  else
    @clients = Client.includes(:companies, :user).where(:user_id => current_user.id)
  end
     

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
      format.xls
      format.xml  { render :xml => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
   # @client = Client.find(params[:id])

    respond_to do |format|
      format.js
      format.html
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    #@client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
   # @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
   # @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente creato correttamente' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    #@client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Cliente aggiornato correttamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    #@client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end
end
