class IcecreamsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_icecream, only: [:show, :edit, :update, :destroy]

  # GET /icecreams
  # GET /icecreams.json
  def index
    @icecreams = Icecream.all
    gon.id = current_user.id
    
  end

  # GET /icecreams/1
  # GET /icecreams/1.json
  def show
  end

  # GET /icecreams/new
  def new
    @icecream = Icecream.new
    check_admin
  end

  # GET /icecreams/1/edit
  def edit
  end

  # POST /icecreams
  # POST /icecreams.json
  def create
    @icecream = Icecream.new(icecream_params)
    check_admin
    respond_to do |format|
      if @icecream.save
        format.html { redirect_to @icecream, notice: 'Icecream was successfully created.' }
        format.json { render :show, status: :created, location: @icecream }
      else
        format.html { render :new }
        format.json { render json: @icecream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icecreams/1
  # PATCH/PUT /icecreams/1.json
  def update
    check_admin
    respond_to do |format|
      if @icecream.update(icecream_params)
        format.html { redirect_to @icecream, notice: 'Icecream was successfully updated.' }
        format.json { render :show, status: :ok, location: @icecream }
      else
        format.html { render :edit }
        format.json { render json: @icecream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icecreams/1
  # DELETE /icecreams/1.json
  def destroy
    check_admin
    @icecream.destroy
    respond_to do |format|
      format.html { redirect_to icecreams_url, notice: 'Icecream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
  def get_top_sellers
      saled = SaleDetail.all.order(quantity: :desc)
      
      data_array, icecreams = [], []
      
      saled.each do |sd|
          ic_data = {icecream: Icecream.new, quantity: 0}
          if !icecreams.include? sd.icecream_id
              icecreams.push sd.icecream_id
              ic_data[:icecream] = sd.icecream
              ic_data[:quantity] = sd.quantity
              data_array.push ic_data
          else
              data_array[icecreams.index(sd.icecream_id)][:quantity] += sd.quantity      
          end
      end
      swapped = true
      while swapped do
        swapped = false
        0.upto(data_array.size-2) do |i|
          if data_array[i][:quantity] < data_array[i+1][:quantity]
            data_array[i], data_array[i+1] = data_array[i+1], data_array[i] # swap values
            swapped = true
          end
        end    
      end
    #return data_array
    render json: data_array
  end

  private
    def check_admin
      authorize @icecream, :can_do?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_icecream
      @icecream = Icecream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def icecream_params
      params.require(:icecream).permit(:flavor, :description, :price, :photo)
    end
end
