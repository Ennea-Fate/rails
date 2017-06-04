class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  before_action -> {check_permissions('admin', 'operator')}, except: [:show, :index]

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
  end
  
  def auto_new
    respond_to do |format|
      format.js do
        @driver = Driver.find(params[:id])
        @driver.auto = Auto.new
      end
    end
  end
  
  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: t('app.drivers.create.success') }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: t('app.drivers.update.success') }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: t('app.drivers.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:fn, :sn, :ln, :birthdate, :TIN, :passport, :auto_id, :remove_auto, :remove_auto_id,
      auto_attributes: [:id, :model, :myclass, :number, :color, :year, :_destroy]
        )
    end
end
