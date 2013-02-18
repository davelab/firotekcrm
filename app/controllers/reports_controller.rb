class ReportsController < ApplicationController
  load_and_authorize_resource
  # GET /reports
  # GET /reports.json
  def index

    @reports = Report.where(:user_id => current_user.id)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    #@report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
   # @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
    #@report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.json
  def create


    #@report = Report.new(params[:report])

    respond_to do |format|
      if @report.save

        if (params[:commit] == 'Salva e Nuovo') 
        format.html { redirect_to new_report_path, notice: 'Report creato con successo.' }
        format.json { render json: new_report_path, status: :created, location: @report }
        else
          format.html { redirect_to reports_path, notice: 'Report creato con successo.' }
        format.json { render json: @report, status: :created, location: @report }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    #@report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        if (params[:commit] == 'Salva e Nuovo') 
          format.html { redirect_to new_report_path, notice: 'Report aggiornato' }
          format.json { head :no_content }
        else
            format.html { redirect_to @report, notice: 'Report aggiornato' }
            format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    #@report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end
end
