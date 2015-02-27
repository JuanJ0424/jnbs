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
