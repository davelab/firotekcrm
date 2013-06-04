class DealsController < ApplicationController
  # GET /deals
  # GET /deals.json

  def index
    @deals = Deal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deals }
    end
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/new
  # GET /deals/new.json
  def new
    @deal = Deal.new

    @pn = protocol_number

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/1/edit
  def edit

    @deal = Deal.find(params[:id])

    @pn = @deal.protocol_number
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(params[:deal])

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render json: @deal, status: :created, location: @deal }
      else

        @pn = protocol_number

        format.html { render action: "new" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deals/1
  # PUT /deals/1.json
  def update
    @deal = Deal.find(params[:id])

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url }
      format.json { head :no_content }
    end
  end



  def protocol_number
     last_deal = Deal.last
     year = Date.today.year.to_s.slice(2..3)
     unless last_deal
      code_number = sprintf '%02d', 1
      pn = code_number + "/" + year 
     else
      pn = last_deal.protocol_number.split('/')
      next_code = sprintf '%02d', pn[0].to_i + 1
      next_year = year.to_i + 1 
      if pn[1].to_s != year.to_s
        pn =  next_code.to_s + "/" + next_year
      else
        pn = next_code.to_s + "/" + year.to_s
      end
     end
  end

end
